from rest_framework import serializers
from .models import *

class booking_doctorSerializer(serializers.ModelSerializer):
    booking_date = serializers.SerializerMethodField()
    booking_time = serializers.SerializerMethodField()
    class Meta:
        model = booking_doctor
        fields = "__all__"


    def get_booking_date(self, obj):
        # Format date as 2025-Feb-21-Fri
        return obj.booking_date.strftime("%Y-%b-%d-%a")

    def get_booking_time(self, obj):
        # Format time as 5:00 AM
        return obj.booking_time.strftime("%I:%M %p")