from django.urls import path
from .views import *

urlpatterns=[
    path("create_book_doc/",create_booking_doctor.as_view(),name="create_book_doc"),
    path("spec_user_booking/<int:phone_number>/",spec_user_booking.as_view(),name="spec_user_booking"),
]