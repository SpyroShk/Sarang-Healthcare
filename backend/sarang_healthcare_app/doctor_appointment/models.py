from django.db import models

class appointments(models.Model):
    user_id=models.CharField(max_length=300)
    username=models.CharField(max_length=60)
    doctorImage=models.CharField(max_length=600,default='')
    doctor_name=models.CharField(max_length=60)
    doctorCategory=models.CharField(max_length=100,default='')
    doctor_id=models.IntegerField()
    appointment_date=models.DateField()
    appointment_time=models.TimeField()
    contact=models.IntegerField()
    patient_name=models.CharField(max_length=60)
    age=models.IntegerField()
    gender=models.CharField(max_length=10)
    user_patient_relation=models.CharField(max_length=20)
    patientDescription=models.TextField(default='')

    def __str__(self):
        return self.username





