from rest_framework import serializers
from .models import *

class medicine_detailsSerializer(serializers.ModelSerializer):
    class Meta:
        model = medicine_details
        fields="__all__"

# class pati_addressSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = pati_address
#         fields = "__all__"
#         read_only_fields = ['sequence_number']

class pati_addressSerializer(serializers.ModelSerializer):
    class Meta:
        model = pati_address
        fields = [
            'id',  # Include ID for selecting a specific address
            'full_name',
            'pry_phone_number',
            'sec_phone_number',
            'flat_house_name',
            'area_building_name',
            'landmark',
            'pincode',
            'town_city',
            'state_name',
            'sequence_number'
        ]
        read_only_fields = ['sequence_number']

class order_placed_detailsSerializer(serializers.ModelSerializer):
    class Meta:
        model = order_placed_details
        fields = "__all__"
        

class add_to_cartSerializer(serializers.ModelSerializer):
    class Meta:
        model = add_to_cart
        fields = "__all__"

        