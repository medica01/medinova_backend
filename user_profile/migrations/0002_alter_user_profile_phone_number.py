# Generated by Django 5.0.3 on 2025-02-06 15:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user_profile', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user_profile',
            name='phone_number',
            field=models.BigIntegerField(null=True, unique=True),
        ),
    ]
