# Generated by Django 5.0.3 on 2025-03-01 19:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('booking_doctor', '0008_favorite_doctor'),
    ]

    operations = [
        migrations.AlterField(
            model_name='favorite_doctor',
            name='doctor_phone_no',
            field=models.BigIntegerField(null=True),
        ),
    ]
