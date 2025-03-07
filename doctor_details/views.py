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




class doctor_addetails(APIView):
    def get(self,request):
        doctor=doctor_details.objects.all()
        serializer=doctor_detailsSerializers(doctor,many=True)
        return Response(serializer.data)
    
    def post(self,request):
        serializer=doctor_detailsSerializers(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
    


class doctor_editdetails(APIView):
    def get(self,request,pk):
        doctor=get_object_or_404(doctor_details,pk=pk)
        serializer=doctor_detailsSerializers(doctor)
        return Response(serializer.data)
    
    def put(self,request,pk):
        doctor=get_object_or_404(doctor_details,pk=pk)
        serializer=doctor_detailsSerializers(doctor,data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_200_OK)
        return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self,request,pk):
        doctor=get_object_or_404(doctor_details,pk=pk)
        doctor.delete()
        return Response({'success': 'deleted successfully'}, status=status.HTTP_204_NO_CONTENT)


class doctor_editdetails_phonenumber(APIView):
    def get(self,request,doc_phone_no):
        doctor=get_object_or_404(doctor_details,doctor_phone_no=doc_phone_no)
        serializer=doctor_detailsSerializers(doctor)
        return Response(serializer.data)
    
    def put(self,request,doc_phone_no):
        doctor=get_object_or_404(doctor_details,doctor_phone_no=doc_phone_no)
        serializer=doctor_detailsSerializers(doctor,data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self,request,doc_phone_no):
        doctor=get_object_or_404(doctor_details,doctor_phone_no=doc_phone_no)
        doctor.delete()
        return Response({'success': 'deleted successfully'}, status=status.HTTP_204_NO_CONTENT)
    

class get_doc_phone(APIView):
    permission_classes = [AllowAny]

    def get(self,request,doctor_phone_no):
        docto=get_object_or_404(doctor_details,doctor_phone_no=doctor_phone_no)
        serializer = doctor_detailsSerializers(docto)
        return Response(serializer.data)
    

class doctor_check_phoneno(APIView):
    permission_classes =[AllowAny]

    def post(self,request):
        doc_phone_number = request.data.get('doctor_phone_no')

        if not doc_phone_number:
            return Response({'error':'phone number must required'},status=status.HTTP_400_BAD_REQUEST)
        
        check_doc_number = doctor_details.objects.filter(doctor_phone_no=doc_phone_number).first()

        if check_doc_number:
            return Response({'message':'doctor phone is exist','status':'old_user'},status=status.HTTP_200_OK)
        else:
            return Response({'message':'no doctor found','status':'new_user'},status=status.HTTP_404_NOT_FOUND)
