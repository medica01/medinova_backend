# Generated by Django 5.0.3 on 2025-03-02 11:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('booking_doctor', '0011_alter_favorite_doctor_doctor_phone_no_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='favorite_doctor',
            name='like',
            field=models.BooleanField(default=False),
        ),
    ]
