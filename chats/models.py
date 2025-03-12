from django.db import models
from django.utils.timezone import now

class ChatMessage(models.Model):
    USER = 'user'
    DOCTOR = 'doctor'

    SENDER_CHOICES = [
        (USER, 'User'),
        (DOCTOR, 'Doctor'),
    ]

    user_phone_no = models.BigIntegerField()  # User's phone number
    doc_phone_no = models.BigIntegerField()  # Doctor's phone number
    sender_type = models.CharField(max_length=10, choices=SENDER_CHOICES)  # Indicates who sent the message
    message = models.TextField()  # Chat message
    datestamp = models.DateField(auto_now_add=True)  # Date of the message
    timestamp = models.TimeField(auto_now_add=True)  # Time of the message

    def __str__(self):
        return f"{self.sender_type.capitalize()} ({self.user_phone_no if self.sender_type == 'user' else self.doc_phone_no}): {self.message[:30]}"


class sstatus(models.Model):
    on_off = models.BooleanField(null=True,blank=True)
    last_time = models.CharField(max_length=100,null=True,blank=True)


    def __int__ (self):
        return self.id