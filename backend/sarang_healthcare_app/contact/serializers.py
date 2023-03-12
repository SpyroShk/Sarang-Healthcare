from rest_framework import serializers
from .models import Contact
# import base64

class ContactSerializer(serializers.ModelSerializer):
    class Meta:
        model=Contact
        fields='__all__'
