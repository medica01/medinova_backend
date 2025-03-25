from django.urls import path
from .views import *

urlpatterns=[
    path("create_medicine_details/",create_medicine_details.as_view(),name="create_medicine_details"),
    path("get_specific_product/<int:product_number>/",get_specific_product.as_view(),name="get_specific_product"),
    path("create_pati_address/",create_pati_address.as_view(),name="create_pati_address"),
    path("get_specific_user_address/<int:pry_phone_number>/",get_specific_user_address.as_view(),name="get_specific_user_address"),
    path('create_pati_address/', create_pati_address.as_view(), name='create-pati-address'),
    path("get_specific_user_specific_address/<int:pry_phone_number>/<int:address_id>/",get_specific_user_specific_address.as_view(),name="get_specific_user_specific_address"),
    path("create_order_placed_details/",create_order_placed_details.as_view(),name="create_order_placed_details"),
    path("get_order_placed_details/<int:pry_phone_number>/",get_order_placed_details.as_view(),name="get_order_placed_details"),
    path("create_add_to_cart/",create_add_to_cart.as_view(),name="create_add_to_cart"),
    path("get_add_to_cart/<int:pry_phone_number>/",get_add_to_cart.as_view(),name="get_add_to_cart"),
    path("delete_your_cart/<int:pry_phone_number>/<int:product_number>/",delete_your_cart.as_view(),name="delete_your_cart"),
    path("get_order_placed_specific_details/<int:pry_phone_number>/<int:product_number>/",get_order_placed_specific_details.as_view(),name="get_order_placed_specific_details")
]