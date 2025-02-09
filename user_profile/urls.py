from django.urls import path
from .views import *

urlpatterns = [
    path("user_create/",user_create.as_view(),name='user_create'),
    path("user_edit/<int:pk>/",user_edit.as_view(),name="user_edit")
]
