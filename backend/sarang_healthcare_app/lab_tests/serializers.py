from rest_framework import serializers
from .models import LabTests

class LabTestsSerializer(serializers.ModelSerializer):
    class Meta:
        model=LabTests
        fields='__all__'