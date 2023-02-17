from django.db import models

class Category(models.Model):
    name=models.CharField(max_length=500)

    def __str__(self):
        return self.name

class Doctor(models.Model):
    name=models.CharField(max_length=500)
    qualifications=models.CharField(max_length=500)
    image=models.ImageField(upload_to='Images/', default='Images/None/No0img.jpg')
    category=models.ForeignKey(Category, on_delete=models.PROTECT,null=True)

    def __str__(self):
        return self.name