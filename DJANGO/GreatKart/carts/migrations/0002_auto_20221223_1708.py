# Generated by Django 3.1 on 2022-12-23 11:38

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0001_initial'),
        ('carts', '0001_initial'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='CartItems',
            new_name='CartItem',
        ),
    ]
