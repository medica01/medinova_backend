# Generated by Django 5.0.3 on 2025-03-25 14:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('medicine_pur', '0014_alter_order_placed_details_purchase_total_price'),
    ]

    operations = [
        migrations.AddField(
            model_name='order_placed_details',
            name='order_date',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]
