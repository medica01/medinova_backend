# Generated by Django 5.0.3 on 2025-03-21 14:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('medicine_pur', '0010_alter_order_placed_details_sequence_number'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order_placed_details',
            name='product_number',
            field=models.BigIntegerField(blank=True, null=True),
        ),
    ]
