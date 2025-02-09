from django.urls import path
from .views import doctor_addetails,doctor_editdetails

urlpatterns=[
    path("doctor_addetails/",doctor_addetails.as_view(),name='doctor_addetails'),
    path("doctor_editdetails/<int:pk>/",doctor_editdetails.as_view(),name='doctor_editdetails'),

]