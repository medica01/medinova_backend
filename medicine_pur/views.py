from django.shortcuts import render
from rest_framework import status # type: ignore
from rest_framework.decorators import api_view
from rest_framework.response import Response 
from .models import *
from .serializers import *
from django.http import Http404, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.views import APIView # type: ignore
from rest_framework.response import Response
from django.http import HttpResponse
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.permissions import AllowAny, IsAuthenticated
from django.shortcuts import get_object_or_404
from django.db.models import Q
from django.views.generic import ListView


class create_medicine_details(APIView):
    permission_classes=[AllowAny]

    def post(self,request):
        serializer = medicine_detailsSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
    

    def get(self,request):
        medicine = medicine_details.objects.all()
        serializer = medicine_detailsSerializer(medicine,many=True)
        return Response(serializer.data,status=status.HTTP_200_OK)
    
class get_specific_product(APIView):
    permission_classes = [AllowAny]

    def get(self,request,product_number):
        product_def = get_object_or_404(medicine_details,product_number=product_number)
        serializer = medicine_detailsSerializer(product_def)
        return Response(serializer.data,status=status.HTTP_200_OK)
    
    def put(self,request,product_number):
        product=get_object_or_404(medicine_details,product_number=product_number)
        serializer = medicine_detailsSerializer(product,data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
    
##########################################################################operation on pati_address ########################################################

class create_pati_address(APIView):
    permission_classes =[AllowAny]

    def post(self,request):
        serializer = pati_addressSerializer(data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
    
    def get(self,request):
        address = pati_address.objects.all()
        serializer = pati_addressSerializer(address,many=True)
        return Response(serializer.data,status=status.HTTP_200_OK)
    

class get_specific_user_address(APIView):

    def get(self,request,pry_phone_number):
        adddress = pati_address.objects.filter(pry_phone_number=pry_phone_number)
        serializer = pati_addressSerializer(adddress,many=True)
        return Response(serializer.data,status=status.HTTP_200_OK)
    
class get_specific_user_specific_address(APIView):

    def get(self,request,pry_phone_number,address_id):
        adddress = get_object_or_404(pati_address,pry_phone_number=pry_phone_number,sequence_number=address_id)
        serializer = pati_addressSerializer(adddress)
        return Response(serializer.data,status=status.HTTP_200_OK)
    
class address_puts_dels(APIView):

    def put(self,request,pry_phone_number,id):
        adddress = get_object_or_404(pati_address,pry_phone_number=pry_phone_number,id=id)
        serializer = pati_addressSerializer(adddress,data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self,request,pry_phone_number,id):
        adddress = get_object_or_404(pati_address,pry_phone_number=pry_phone_number,id=id)
        adddress.delete()
        return Response({"success":"delete successfuly"},status=status.HTTP_204_NO_CONTENT)
    
###########################################################################order placed details ###########################################################


class create_order_placed_details(APIView):
    permission_classes=[AllowAny]

    def post(self,request):

        pry_phone_number = request.data.get("pry_phone_number")
        product_number = request.data.get("product_number")
        purchase_quantity = request.data.get("purchase_quantity")
        purchase_total_price = request.data.get("purchase_total_price")
        purchase_pay_type = request.data.get("purchase_pay_type")
        order_date=request.data.get("order_date")

        if not all([pry_phone_number,product_number]):
            return Response({"message":"give the input for phone number and product number"})
        

        product =  get_object_or_404(medicine_details,product_number=product_number)
        patient = get_object_or_404(pati_address,pry_phone_number=pry_phone_number)


        order_placed = order_placed_details.objects.create(
            product_details = product,
            user_details = patient,
            product_name = product.product_name,
            product_number = product_number,
            quantity = product.quantity,
            price = product.price,
            purchase_quantity = purchase_quantity,
            purchase_total_price = purchase_total_price,
            purchase_pay_type = purchase_pay_type,
            order_date=order_date,
            cure_disases = product.cure_disases,
            product_image = product.product_image,
            about_product = product.about_product,
            product_type = product.product_type,
            full_name = patient.full_name,
            pry_phone_number = pry_phone_number,
            sec_phone_number = patient.sec_phone_number,
            flat_house_name = patient.flat_house_name,
            area_building_name = patient.area_building_name,
            landmark = patient.landmark,
            pincode = patient.pincode,
            town_city = patient.town_city,
            state_name = patient.state_name,
            sequence_number = patient.sequence_number
        )

        serializer = order_placed_detailsSerializer(order_placed)
        return Response(serializer.data,status=status.HTTP_201_CREATED)
    
class get_order_placed_details(APIView):

    def get(self,request,pry_phone_number):
        order_placed_patient = order_placed_details.objects.filter(pry_phone_number=pry_phone_number)
        serializer = order_placed_detailsSerializer(order_placed_patient,many=True)
        return Response(serializer.data,status=status.HTTP_200_OK)
    
class get_order_placed_specific_details(APIView):

    def get(self,request,pry_phone_number,product_number):
        order_place_specific_product = get_object_or_404(order_placed_details,pry_phone_number=pry_phone_number,product_number=product_number)
        serializer = order_placed_detailsSerializer(order_place_specific_product)
        return Response(serializer.data,status=status.HTTP_200_OK)

    

###################################################################### create add to cart #########################################################

class create_add_to_cart(APIView):
    permission_classes=[AllowAny]

    def post(self,request):
        
        pry_phone_number = request.data.get("pry_phone_number")
        product_number = request.data.get("product_number")

        if not all([pry_phone_number,product_number]):
            return Response({"message":"give the input for phone number and product number"})
        
        product = get_object_or_404(medicine_details,product_number=product_number)

        adds_to_carts= add_to_cart.objects.create(
            products = product,
            pry_phone_number =pry_phone_number,
            product_name = product.product_name,
            product_number = product_number,
            quantity = product.quantity,
            price = product.price,
            cure_disases = product.cure_disases,
            product_image = product.product_image,
            about_product = product.about_product,
            product_type = product.product_type
        )

        serializer = add_to_cartSerializer(adds_to_carts)
        return Response(serializer.data,status=status.HTTP_201_CREATED)
    
class get_add_to_cart(APIView):
    permission_classes=[AllowAny]

    def get(self,request,pry_phone_number):
        cart = add_to_cart.objects.filter(pry_phone_number=pry_phone_number)
        serializer= add_to_cartSerializer(cart,many=True)
        return Response(serializer.data,status=status.HTTP_200_OK)

class delete_your_cart(APIView):
    permission_classes=[AllowAny]

    def delete(self,request,pry_phone_number,product_number):
        delete_cart = add_to_cart.objects.filter(pry_phone_number=pry_phone_number,product_number=product_number)
        delete_cart.delete()
        return Response({"message":"your cart is delete"},status=status.HTTP_204_NO_CONTENT)
    
