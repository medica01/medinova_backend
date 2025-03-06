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
from django.db.models import Q



class SendMessageView(APIView):
    def post(self, request):
        """
        Handles sending messages from user to doctor or doctor to user.
        """
        sender_phone = request.data.get("sender_phone")
        receiver_phone = request.data.get("receiver_phone")
        message = request.data.get("message")
        sender_type = request.data.get("sender_type")  # "user" or "doctor"

        if not all([sender_phone, receiver_phone, message, sender_type]):
            return Response({"error": "All fields are required"}, status=status.HTTP_400_BAD_REQUEST)

        # Save the message in the database
        chats_message = ChatMessage.objects.create(
            user_phone_no=sender_phone if sender_type == "user" else receiver_phone,
            doc_phone_no=receiver_phone if sender_type == "user" else sender_phone,
            sender_type=sender_type,
            message=message
        )
        serializer = ChatMessageSerializer(chats_message)
        return Response(serializer.data, status=status.HTTP_201_CREATED)


class UserDoctorChatHistoryView(APIView):
    def get(self, request, user_phone, doctor_phone):
        """
        Retrieves chat history between a specific user and doctor.
        """
        chats = ChatMessage.objects.filter(
            (Q(user_phone_no=user_phone) & Q(doc_phone_no=doctor_phone)) |
            (Q(user_phone_no=doctor_phone) & Q(doc_phone_no=user_phone))
        ).order_by('datestamp', 'timestamp')  # Ensure correct ordering

        serializer = ChatMessageSerializer(chats, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    

class DoctorChatHistoryView(APIView):
    def get(self, request, doc_phone):
        """
        Retrieves chat history for a specific doctor.
        """
        chats = ChatMessage.objects.filter(doc_phone_no=doc_phone)|ChatMessage.objects.filter(user_phone_no=doc_phone).order_by('timestamp')
        serializer = ChatMessageSerializer(chats, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
