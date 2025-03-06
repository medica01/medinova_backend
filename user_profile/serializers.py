from .models import *
from rest_framework import serializers

class user_profileSerializers(serializers.ModelSerializer):
    class Meta:
        model = user_profile
        fields = "__all__"