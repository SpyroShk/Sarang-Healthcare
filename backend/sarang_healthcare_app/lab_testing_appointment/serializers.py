from rest_framework import serializers
from .models import labtestings

class labtestingsSerializer(serializers.ModelSerializer):
    collectionDate = serializers.DateField(source="collection_date")
    collectionTime = serializers.TimeField(source="collection_time")
    class Meta:
        model= labtestings
        fields=['id','userId','username','testList','collectionDate','collectionTime','contact','age','gender','patientName','userPatientRelation','service','city','address','landmark']
    
    def create(self, validated_data):
        return labtestings.objects.create(**validated_data)