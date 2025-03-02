from django.db import models

# Create your models here.
class doctor_details(models.Model):
    doctor_name = models.CharField(max_length=100,null=True,blank=True)
    doctor_phone_no = models.BigIntegerField(null=True,unique=True)
    doctor_email=models.EmailField(null=True,blank=True)
    specialty=models.CharField(max_length=100,null=True,blank=True)
    service=models.IntegerField(null=True,blank=True)
    language=models.CharField(max_length=100,null=True,blank=True)
    doctor_image=models.FileField(max_length=100,null=True,blank=True)
    qualification=models.CharField(max_length=100,null=True,blank=True)
    bio=models.TextField(null=True,blank=True)
    reg_no=models.BigIntegerField(null=True,blank=True)
    doctor_location=models.TextField(null=True,blank=True)
    like = models.BooleanField(null=True)


def __int__(self):
        return self.doctor_phone_no
