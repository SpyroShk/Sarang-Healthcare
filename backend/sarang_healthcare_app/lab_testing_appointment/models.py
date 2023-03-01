from django.db import models

class labtestings(models.Model):
    userId=models.CharField(max_length=300)
    username=models.CharField(max_length=60)
    testList=models.TextField(default='')
    collection_date=models.DateField()
    collection_time=models.TimeField()
    contact=models.IntegerField()
    patientName=models.CharField(max_length=60)
    age=models.IntegerField()
    gender=models.CharField(max_length=10)
    userPatientRelation=models.CharField(max_length=20)
    service=models.CharField(max_length=60)
    city=models.CharField(max_length=100)
    address=models.CharField(max_length=100)
    landmark=models.CharField(max_length=200)

    def __str__(self):
        return self.username




