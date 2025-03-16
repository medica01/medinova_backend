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
    path("get_chat_history/",get_chat_history.as_view(),name="get_chat_history"),
    path("get_doc_app_booking_history/",get_doc_app_booking_history.as_view(),name="get_doc_app_booking_history"),
    path("search_chat_doc_only_user_chat/",search_chat_doc_only_user_chat.as_view(),name='search_chat_doc_only_user_chat'),
    path("search_doc_fav/",search_doc_fav.as_view(),name='search_doc_fav'),
    path("delete_specific_user_doctor/<str:phone_number>/<str:doc_phone_number>/<str:booking_date>/<str:booking_time>/",delete_specific_user_doctor.as_view(),name="delete_specific_user_doctor",),
    path("get_specific_user_doc_date_time/<str:phone_number>/<str:doc_phone_number>/<str:booking_date>/<str:booking_time>/",get_specific_user_doc_date_time.as_view(),name="get_specific_user_doc_date_time",)

]