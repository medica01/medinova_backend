# Generated by Django 5.0.3 on 2025-04-15 14:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('medicine_pur', '0015_order_placed_details_order_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='medicine_details',
            name='product_image',
            field=models.ImageField(blank=True, null=True, upload_to='medicine_images/'),
        ),
    ]
