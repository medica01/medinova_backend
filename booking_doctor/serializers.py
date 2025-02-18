from rest_framework import serializers
from .models import *

class booking_doctorSerializer(serializers.ModelSerializer):
    class Meta:
        model = booking_doctor
        fields = "__all__"