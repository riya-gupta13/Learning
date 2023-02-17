from django.db import models


# Create your models here.
class UserProfile(models.Model):
    # fileField is used take all file whereas imagefield only takes images
    image = models.ImageField(upload_to="images")
