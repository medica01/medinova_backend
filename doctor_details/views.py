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
    
        