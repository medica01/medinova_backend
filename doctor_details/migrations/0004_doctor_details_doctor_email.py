# Generated by Django 5.0.3 on 2025-02-25 13:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('doctor_details', '0003_doctor_details_doctor_phone_no'),
    ]

    operations = [
        migrations.AddField(
            model_name='doctor_details',
            name='doctor_email',
            field=models.EmailField(blank=True, max_length=254, null=True),
        ),
    ]
