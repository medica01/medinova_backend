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


class user_create(APIView):
    def get(self,request):
        user= user_profile.objects.all()
        serializer=user_profileSerializers(user,many=True)
        return Response(serializer.data)
    
    def post(self,request):
        serializer = user_profileSerializers(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class user_edit(APIView):
    def get(self,request,phone_number):
        user= get_object_or_404(user_profile,phone_number=phone_number)
        serializer = user_profileSerializers(user)
        return Response(serializer.data)
    
    def put(self,request,phone_number):
        user =get_object_or_404(user_profile,phone_number=phone_number)
        serializer =user_profileSerializers(user,data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)  # Correct status
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self,request,phone_number):
        user = get_object_or_404(user_profile,phone_number=phone_number)
        user.delete()
        return Response({'success':'deleted successfully'},status=status.HTTP_204_NO_CONTENT)



class check_phoneno(APIView):
    permission_classes =[AllowAny]

    def post(self,request):
        phone_number= request.data.get('phone_number')

        if not phone_number:
            return Response({'error': 'phone number must required'}, status=status.HTTP_400_BAD_REQUEST)


        check_phone= user_profile.objects.filter(phone_number=phone_number).first()

        if check_phone:
            return Response({'message':'user phone is exist','status':'old_user'},status=status.HTTP_200_OK)
        else:
            return Response({'message':'no user found','status':'new_user'},status=status.HTTP_404_NOT_FOUND)

