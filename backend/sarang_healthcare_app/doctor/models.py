from django.db import models

class Category(models.Model):
    name=models.CharField(max_length=500)

class Doctor(models.Model):
    name=models.CharField(max_length=500)
    qualifications=models.CharField(max_length=500)
    image=models.ImageField(null=True)
    category=models.ForeignKey(Category, on_delete=models.PROTECT,null=True)
