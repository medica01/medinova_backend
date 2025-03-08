from django.contrib import admin
from .models import *
# Register your models here.

admin.site.register(booking_doctor)

admin.site.register(favorite_doctor)

admin.site.register(chat_doc_only_user_chat)
