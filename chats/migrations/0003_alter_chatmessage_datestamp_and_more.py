# Generated by Django 5.0.3 on 2025-03-03 15:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('chats', '0002_alter_chatmessage_datestamp_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='chatmessage',
            name='datestamp',
            field=models.DateField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='chatmessage',
            name='timestamp',
            field=models.TimeField(auto_now_add=True),
        ),
    ]
