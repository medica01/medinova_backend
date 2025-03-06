from .models import *
from rest_framework import serializers


class doctor_detailsSerializers(serializers.ModelSerializer):
    class Meta:
        model=doctor_details
        fields="__all__"