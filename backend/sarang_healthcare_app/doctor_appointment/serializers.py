from rest_framework import serializers
from .models import appointments

class appointmentsSerializer(serializers.ModelSerializer):
    userId = serializers.CharField(source="user_id")
    doctorName = serializers.CharField(source="doctor_name")
    doctorId = serializers.IntegerField(source="doctor_id")
    appointmentDate = serializers.DateField(source="appointment_date")
    appointmentTime = serializers.TimeField(source="appointment_time")
    patientName = serializers.CharField(source="patient_name")
    userPatientRelation = serializers.CharField(source="user_patient_relation")
    class Meta:
        model= appointments
        fields=['id','userId','username','doctorName','doctorId','doctorImage','doctorCategory','appointmentDate','appointmentTime','contact','age','gender','patientName','userPatientRelation','patientDescription']
    
    def create(self, validated_data):
        return appointments.objects.create(**validated_data)