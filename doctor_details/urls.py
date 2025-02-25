from django.urls import path
from .views import *

urlpatterns=[
    path("doctor_addetails/",doctor_addetails.as_view(),name='doctor_addetails'),
    path("doctor_editdetails/<int:pk>/",doctor_editdetails.as_view(),name='doctor_editdetails'),
    path("doc_editdetails_phone/<int:doc_phone_no>/",doctor_editdetails_phonenumber.as_view(),name='doctor_editdetails_phoneno'),
    path("doc_check_phone/",doctor_check_phoneno.as_view(),name='doc_check_number'),
]