# Generated by Django 5.0.3 on 2025-02-26 16:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('booking_doctor', '0004_booking_doctor_age_booking_doctor_doc_phone_number_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='booking_doctor',
            name='doc_phone_number',
            field=models.BigIntegerField(null=True),
        ),
    ]
