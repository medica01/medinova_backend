from django.db import models

from doctor_details.models import doctor_details
from user_profile.models import user_profile
from django.utils.timezone import now

# Create your models here.
class booking_doctor(models.Model):
    patient = models.ForeignKey(user_profile,on_delete=models.CASCADE,null=True,blank=True)
    doctor = models.ForeignKey(doctor_details, on_delete=models.CASCADE, null=True, blank=True)
    phone_number = models.BigIntegerField()  # Store only the user's phone number
    doctor_name = models.CharField(max_length=100)
    specialty = models.CharField(max_length=100)
    service = models.IntegerField(null=True, blank=True)
    language = models.CharField(max_length=100)
    doctor_image = models.FileField(upload_to="doctor_images/", null=True, blank=True)
    qualification = models.CharField(max_length=100)
    bio = models.TextField(null=True, blank=True)
    reg_no = models.BigIntegerField(null=True, blank=True)
    doctor_location = models.TextField(null=True, blank=True)
    # user field
    first_name = models.CharField(max_length=100,null=True,blank=True)
    last_name = models.CharField(max_length=100,null=True,blank=True)
    gender = models.CharField(max_length=10,null=True,blank=True)
    age = models.PositiveIntegerField(null=True,blank=True)
    doc_phone_number=models.BigIntegerField(null=True) #store the doctor_phone number
    email=models.EmailField(null=True,blank=True)
    location=models.CharField(max_length=200,null=True,blank=True)
    user_photo = models.FileField(null=True,blank=True)
    # end
    booking_date = models.DateField()
    booking_time = models.TimeField()
    created_at = models.DateTimeField(auto_created=True, default=now)

    class Meta:
        unique_together=("phone_number","doc_phone_number","booking_date","booking_time")

    def __int__ (self):
        return self.phone_number

#####################################################################################favorite doctor############################################################################################

class favorite_doctor(models.Model):
    doctor = models.ForeignKey(doctor_details, on_delete=models.CASCADE, null=True, blank=True)
    phone_number = models.BigIntegerField()  # User's phone number
    like = models.BooleanField(default=False)
    doctor_name = models.CharField(max_length=100, null=True, blank=True)
    doctor_phone_no = models.BigIntegerField(null=True, blank=True)  # Remove unique=True
    specialty = models.CharField(max_length=100, null=True, blank=True)
    service = models.IntegerField(null=True, blank=True)
    language = models.CharField(max_length=100, null=True, blank=True)
    doctor_image = models.FileField(max_length=100, null=True, blank=True)
    qualification = models.CharField(max_length=100, null=True, blank=True)
    bio = models.TextField(null=True, blank=True)
    reg_no = models.BigIntegerField(null=True, blank=True)
    doctor_location = models.TextField(null=True, blank=True)

    class Meta:
        unique_together = ("phone_number", "doctor")  # Prevent duplicate doctor for the same user



#####################################################################################chat_doctor_get###############################################################################################


class chat_doc_only_user_chat(models.Model):
    patient = models.ForeignKey(user_profile,on_delete=models.CASCADE,null=True,blank=True)
    doctor_phone_number= models.BigIntegerField()
    phone_number = models.BigIntegerField(null= True,blank=True)
    first_name = models.CharField(max_length=100,null=True,blank=True)
    last_name = models.CharField(max_length=100,null=True,blank=True)
    gender = models.CharField(max_length=10,null=True,blank=True)
    age = models.PositiveIntegerField(null=True,blank=True)
    email=models.EmailField(null=True,blank=True)
    location=models.CharField(max_length=200,null=True,blank=True)
    user_photo = models.FileField(null=True,blank=True)

    class Meta:
        unique_together=("phone_number","doctor_phone_number")
