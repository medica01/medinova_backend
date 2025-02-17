from django.urls import path
from .views import *

urlpatterns = [
    path("user_create/",user_create.as_view(),name='user_create'),
    path("user_edit/<int:phone_number>/",user_edit.as_view(),name="user_edit"),
    path("check_phone_number/",check_phoneno.as_view(),name='check_phone_number'),
]
