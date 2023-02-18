from rest_framework import serializers
from .models import appointments

class appointmentsSerializer(serializers.ModelSerializer):

    class Meta:
        model= appointments
        fields='__all__'
    
    def create(self, validated_data):
        return appointments.objects.create(**validated_data)