# Generated by Django 5.0.3 on 2025-04-19 20:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('chats', '0006_rename_product_image_chatmessage_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='chatmessage',
            name='message',
            field=models.TextField(blank=True, null=True),
        ),
    ]
