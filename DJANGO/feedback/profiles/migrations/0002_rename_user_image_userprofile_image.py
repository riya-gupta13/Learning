# Generated by Django 4.0.2 on 2022-03-08 12:25

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('profiles', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='userprofile',
            old_name='user_image',
            new_name='image',
        ),
    ]
