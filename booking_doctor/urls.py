from django.urls import path
from .views import *

urlpatterns=[
    path("create_booking_doctor_user/",create_booking_doctor_user.as_view(),name="create_booking_doctor_user"),
    path("spec_user_booking/<int:phone_number>/",spec_user_booking.as_view(),name="spec_user_booking"),
    path("spec_doctor_booked/<int:doc_phone_number>/",spec_doctor_booked.as_view(),name="spec_doctor_booked"),
    path("create_favorite_doc/",create_favorite_doc.as_view(),name="create_favorite_doc"),
    path("get_fav_doc/<int:phone_number>/",get_fav_doc.as_view(),name="get_fav_doc"),
    path("delete_fav_doc/",delete_fav_doc.as_view(),name="delete_fav_doc"),
    path("create_chat_doc_only_user_chat/",create_chat_doc_only_user_chat.as_view(),name="create_chat_doc_only_user_chat"),
    path("get_chat_doc_only_user_chat/<int:doctor_phone_number>/",get_chat_doc_only_user_chat.as_view(),name="get_chat_doc_only_user_chat"),
]