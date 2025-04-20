from django.urls import path
from .views import *

urlpatterns = [
    path('send-message/', SendMessageView.as_view(), name='send_message'),
    path('user-chat/<int:user_phone>/<int:doctor_phone>/', UserDoctorChatHistoryView.as_view(), name='user_chat'),
    path('doctor-chat/<int:doc_phone>/', DoctorChatHistoryView.as_view(), name='doctor_chat'),
    path('search_chat/',search_chat.as_view(),name='search_chat'),
    path('delete_chat_user_doc/<int:id>/',delete_chat_user_doc.as_view(),name="delete_chat_user_doc"),
    path('on_offline/',on_offline.as_view(),name='on_offline'),
    path('put_on_off/<int:id>/',put_on_off.as_view(),name='put_on_off'),
]
