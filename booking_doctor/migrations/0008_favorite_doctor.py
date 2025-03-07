# Generated by Django 5.0.3 on 2025-03-01 19:32

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('booking_doctor', '0007_alter_booking_doctor_doc_phone_number'),
        ('doctor_details', '0004_doctor_details_doctor_email'),
    ]

    operations = [
        migrations.CreateModel(
            name='favorite_doctor',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('phone_number', models.BigIntegerField()),
                ('like', models.BooleanField()),
                ('doctor_name', models.CharField(blank=True, max_length=100, null=True)),
                ('doctor_phone_no', models.BigIntegerField(null=True, unique=True)),
                ('doctor_email', models.EmailField(blank=True, max_length=254, null=True)),
                ('specialty', models.CharField(blank=True, max_length=100, null=True)),
                ('service', models.IntegerField(blank=True, null=True)),
                ('language', models.CharField(blank=True, max_length=100, null=True)),
                ('doctor_image', models.FileField(blank=True, null=True, upload_to='')),
                ('qualification', models.CharField(blank=True, max_length=100, null=True)),
                ('bio', models.TextField(blank=True, null=True)),
                ('reg_no', models.BigIntegerField(blank=True, null=True)),
                ('doctor_location', models.TextField(blank=True, null=True)),
                ('doctor', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='doctor_details.doctor_details')),
            ],
        ),
    ]
