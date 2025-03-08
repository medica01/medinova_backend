from datetime import datetime
from django.shortcuts import render
from rest_framework import status # type: ignore
from rest_framework.decorators import api_view
from rest_framework.response import Response 
from .models import *
from .serializers import *
from django.http import Http404, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.views import APIView # type: ignore
from rest_framework.response import Response
from django.http import HttpResponse
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.permissions import AllowAny, IsAuthenticated
from django.shortcuts import get_object_or_404
from datetime import datetime


# class create_booking_doctor_user(APIView):
#     permission_classes = [AllowAny]

#     def post(self, request):
        
#         doctor_id = request.data.get("id")
#         phone_number = request.data.get("phone_number")
#         booking_date = request.data.get("booking_date")  # Expecting: "2025-Feb-21-Fri"
#         booking_time = request.data.get("booking_time")  # Expecting: "5:00 AM"

#         # Get the doctor details
#         doctor = get_object_or_404(doctor_details, id=doctor_id)
#         user = get_object_or_404(user_profile,phone_number=phone_number)

#         

#        # Parse and store date as YYYY-MM-DD
#         parsed_booking_date = datetime.strptime(booking_date, "%Y-%b-%d-%a").date()

#         # Parse and store time as time object
#         parsed_booking_time = datetime.strptime(booking_time, "%I:%M %p").time()

#         # Create booking
#         booking_doctorr = booking_doctor.objects.create(
#             doctor=doctor,
#             patient=user,
#             phone_number=phone_number,
#             doctor_name=doctor.doctor_name,
#             specialty=doctor.specialty,
#             service=doctor.service,
#             language=doctor.language,
#             doctor_image=doctor.doctor_image,
#             qualification=doctor.qualification,
#             bio=doctor.bio,
#             reg_no=doctor.reg_no,
#             doctor_location=doctor.doctor_location,
#             first_name = user.first_name,
#             last_name = user.last_name,
#             gender = user.gender,
#             age = user.age,
#             doc_phone_number= doctor.doctor_phone_no,
#             email=user.email,
#             location=user.location,
#             user_photo = user.user_photo,
#             booking_date=parsed_booking_date,  # Stored as YYYY-MM-DD
#             booking_time=parsed_booking_time  # Stored as time object
#         )

#         serializer = booking_doctorSerializer(booking_doctorr)
#         return Response(serializer.data, status=status.HTTP_201_CREATED)



class create_booking_doctor_user(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        doctor_id = request.data.get("id")
        phone_number = request.data.get("phone_number")
        booking_date = request.data.get("booking_date")  # Expecting: "2025-Feb-21-Fri"
        booking_time = request.data.get("booking_time")  # Expecting: "5:00 AM"

        # Validate required fields
        if not all([doctor_id, phone_number, booking_date, booking_time]):
            return Response({"message": "Missing required fields"}, status=status.HTTP_400_BAD_REQUEST)

        # Get the doctor and user details
        doctor = get_object_or_404(doctor_details, id=doctor_id)
        user = get_object_or_404(user_profile, phone_number=phone_number)

        # Convert booking_date and booking_time safely
        try:
            parsed_booking_date = datetime.strptime(booking_date, "%Y-%b-%d-%a").date()
        except ValueError:
            return Response({"message": "Invalid booking_date format. Expected format: YYYY-MMM-DD-Day (e.g., 2025-Feb-21-Fri)"}, status=status.HTTP_400_BAD_REQUEST)

        try:
            parsed_booking_time = datetime.strptime(booking_time, "%I:%M %p").time()
        except ValueError:
            return Response({"message": "Invalid booking_time format. Expected format: hh:mm AM/PM (e.g., 5:00 AM)"}, status=status.HTTP_400_BAD_REQUEST)

        # Check if a booking exists for the same doctor, same time, and same patient
        existing_booking = booking_doctor.objects.filter(
            doctor=doctor,
            patient=user,
            booking_date=parsed_booking_date,
            booking_time=parsed_booking_time
        ).exists()

        if existing_booking:
            return Response({"message": "This slot is already booked."}, status=status.HTTP_400_BAD_REQUEST)

        # Create booking
        booking_instance = booking_doctor.objects.create(
            doctor=doctor,
            patient=user,
            phone_number=phone_number,
            doctor_name=doctor.doctor_name,
            specialty=doctor.specialty,
            service=doctor.service,
            language=doctor.language,
            doctor_image=doctor.doctor_image,
            qualification=doctor.qualification,
            bio=doctor.bio,
            reg_no=doctor.reg_no,
            doctor_location=doctor.doctor_location,
            first_name=user.first_name,
            last_name=user.last_name,
            gender=user.gender,
            age=user.age,
            doc_phone_number=doctor.doctor_phone_no,
            email=user.email,
            location=user.location,
            user_photo=user.user_photo,
            booking_date=parsed_booking_date,
            booking_time=parsed_booking_time
        )

        serializer = booking_doctorSerializer(booking_instance)
        return Response(serializer.data, status=status.HTTP_201_CREATED)



class spec_user_booking(APIView):
    permission_classes = [AllowAny]


    def get(self,request,phone_number):
        user_booking = booking_doctor.objects.filter(phone_number=phone_number)


        serializer = booking_doctorSerializer(user_booking,many=True)

        return Response(serializer.data)
    

class spec_doctor_booked(APIView):
    permission_classes = [AllowAny]

    def get(self,request,doc_phone_number):
        booked_doc = booking_doctor.objects.filter(doc_phone_number=doc_phone_number)


        serializer = booking_doctorSerializer(booked_doc,many=True)

        return Response(serializer.data)
    


################################################################################# Favorite doctor ####################################################################


class create_favorite_doc(APIView):
    permission_classes=[AllowAny]

    def post(self,request):

        phone_number = request.data.get("phone_number")
        like = request.data.get("like")
        fav_doc_id=request.data.get("id")

        doctorr = get_object_or_404(doctor_details,id=fav_doc_id)
        
        existing_fav_doc = favorite_doctor.objects.filter(phone_number=phone_number, doctor=doctorr).first()

        if existing_fav_doc:
            return Response({"message": "Doctor is already marked as favorite."}, status=status.HTTP_200_OK)


        favorite_doctor_user = favorite_doctor.objects.create(
            doctor=doctorr,
            like=like,
            phone_number=phone_number,
            doctor_name=doctorr.doctor_name,
            doctor_phone_no = doctorr.doctor_phone_no,
            specialty=doctorr.specialty,
            service=doctorr.service,
            language=doctorr.language,
            doctor_image=doctorr.doctor_image,
            qualification=doctorr.qualification,
            bio=doctorr.bio,
            reg_no=doctorr.reg_no,
            doctor_location=doctorr.doctor_location
        )


        serializer = favorite_doctorSerializer(favorite_doctor_user)
        return Response(serializer.data,status=status.HTTP_201_CREATED)
        
    

class get_fav_doc(APIView):
    permission_classes = [AllowAny]

    def get(self, request, phone_number):
        fav_docs = favorite_doctor.objects.filter(phone_number=phone_number)

        if not fav_docs.exists():
            return Response({"message": "No favorite doctors found for this user."}, status=status.HTTP_404_NOT_FOUND)

        serializer = favorite_doctorSerializer(fav_docs, many=True)  # Use many=True
        return Response(serializer.data, status=status.HTTP_200_OK)


class delete_fav_doc(APIView):
    def delete(self, request):
        phone_number = request.data.get("phone_number")  # Get phone number from query params
        doctor_id = request.data.get("doctor_id")  # Get doctor_id from query params
        
        if not phone_number or not doctor_id:
            return Response({"error": "Phone number and doctor ID are required"}, status=status.HTTP_400_BAD_REQUEST)

        # Find and delete the specific doctor for the given phone number
        favorite = get_object_or_404(favorite_doctor, phone_number=phone_number, doctor_id=doctor_id)
        favorite.delete()

        return Response({"message": f"Doctor {doctor_id} removed from favorites for {phone_number}"}, status=status.HTTP_200_OK)


############################################################################chat_doctor_get###################################################################

class create_chat_doc_only_user_chat(APIView):
    permission_classes=[AllowAny]

    def post(self,request):

        phone_number = request.data.get("phone_number")
        doctor_phone_number = request.data.get("doctor_phone_number")

        patients = get_object_or_404(user_profile,phone_number=phone_number)


        existing_chat_doc_user = chat_doc_only_user_chat.objects.filter(doctor_phone_number=doctor_phone_number, phone_number=phone_number).first()

        if existing_chat_doc_user:
            return Response({"message": "Doctor is already chat."}, status=status.HTTP_200_OK)



        create_doc_user = chat_doc_only_user_chat.objects.create(
            patient = patients,
            doctor_phone_number= doctor_phone_number,
            phone_number = phone_number,
            first_name = patients.first_name,
            last_name = patients.last_name,
            gender = patients.gender,
            age = patients.age,
            email=patients.email,
            location=patients.location,
            user_photo = patients.user_photo
        )

        serializer = chat_doc_only_user_chatSerializer(create_doc_user)
        return Response(serializer.data,status=status.HTTP_201_CREATED)
    
class get_chat_doc_only_user_chat(APIView):
    permission_classes = [AllowAny]

    def get(self,request,doctor_phone_number):
        doctor_phone_number = chat_doc_only_user_chat.objects.filter(doctor_phone_number=doctor_phone_number)

        if not doctor_phone_number.exists():
            return Response({"message": "No user chat found for this doctor."}, status=status.HTTP_404_NOT_FOUND)
        
        serializer = chat_doc_only_user_chatSerializer(doctor_phone_number,many=True)
        return Response(serializer.data,status=status.HTTP_200_OK)