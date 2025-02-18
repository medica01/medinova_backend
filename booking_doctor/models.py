from django.db import models

from doctor_details.models import doctor_details
from user_profile.models import user_profile
from django.utils.timezone import now

# Create your models here.
class booking_doctor(models.Model):
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
    booking_date = models.DateField()
    booking_time = models.TimeField()
    created_at = models.DateTimeField(auto_created=True, default=now)

    def __int__ (self):
        return self.phone_number