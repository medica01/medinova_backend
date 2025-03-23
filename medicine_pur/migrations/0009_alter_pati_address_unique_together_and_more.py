# Generated by Django 5.0.3 on 2025-03-21 13:18

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('medicine_pur', '0008_rename_pry_phone_number_pati_address_pry_phone_number_and_more'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='pati_address',
            unique_together=set(),
        ),
        migrations.CreateModel(
            name='order_placed_details',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product_name', models.CharField(blank=True, max_length=100, null=True)),
                ('product_number', models.BigIntegerField(blank=True, null=True, unique=True)),
                ('quantity', models.BigIntegerField(blank=True, null=True)),
                ('price', models.BigIntegerField(blank=True, null=True)),
                ('cure_disases', models.CharField(blank=True, max_length=100, null=True)),
                ('product_image', models.FileField(blank=True, null=True, upload_to='')),
                ('about_product', models.TextField(blank=True, null=True)),
                ('product_type', models.CharField(blank=True, max_length=100, null=True)),
                ('full_name', models.CharField(blank=True, max_length=100, null=True)),
                ('pry_phone_number', models.BigIntegerField(blank=True, null=True)),
                ('sec_phone_number', models.BigIntegerField(blank=True, null=True)),
                ('flat_house_name', models.CharField(blank=True, max_length=100, null=True)),
                ('area_building_name', models.CharField(blank=True, max_length=100, null=True)),
                ('landmark', models.CharField(blank=True, max_length=100, null=True)),
                ('pincode', models.BigIntegerField(blank=True, null=True)),
                ('town_city', models.CharField(blank=True, max_length=100, null=True)),
                ('state_name', models.CharField(blank=True, max_length=100, null=True)),
                ('sequence_number', models.IntegerField(null=True)),
                ('product_details', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='medicine_pur.medicine_details')),
                ('user_details', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='medicine_pur.pati_address')),
            ],
        ),
    ]
