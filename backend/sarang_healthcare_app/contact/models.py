from django.db import models

class Contact(models.Model):
    phone=models.IntegerField()
    mobile=models.IntegerField()
    email=models.EmailField()
    location=models.CharField(max_length=500)
    sm1=models.CharField(max_length=500)
    sm2=models.CharField(max_length=500)
    sm4=models.CharField(max_length=500)
    sm3=models.CharField(max_length=500)

    def __str__(self):
        return self.email