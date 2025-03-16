from django.db import models
from django.utils.timezone import now

# Create your models here.
class user_profile(models.Model):
    first_name = models.CharField(max_length=100,null=True,blank=True)
    last_name = models.CharField(max_length=100,null=True,blank=True)
    gender = models.CharField(max_length=10,null=True,blank=True)
    age = models.PositiveIntegerField(null=True,blank=True)
    phone_number=models.BigIntegerField(null=True,unique=True)
    email=models.EmailField(null=True,blank=True)
    location=models.CharField(max_length=200,null=True,blank=True)
    user_photo = models.FileField(null=True,blank=True)
    user_status = models.BooleanField(null=True,blank=True)
    created_at = models.DateTimeField(auto_created=True, default=now)


def __int__ (self):
        return self.phone_number