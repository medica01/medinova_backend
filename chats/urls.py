from django.urls import path
from .views import *

urlpatterns = [
    path('send-message/', SendMessageView.as_view(), name='send_message'),
    path('user-chat/<int:user_phone>/<int:doctor_phone>/', UserDoctorChatHistoryView.as_view(), name='user_chat'),
    path('doctor-chat/<int:doc_phone>/', DoctorChatHistoryView.as_view(), name='doctor_chat'),
]
