from rest_framework import serializers
from .models import Doctor
# import base64

class DoctorSerializer(serializers.ModelSerializer):
    category=serializers.StringRelatedField()
    image = serializers.ImageField(max_length=None, use_url=True)
    # imageMemory=serializers.SerializerMethodField("get_imageMemory")
    class Meta:
        model=Doctor
        fields=('id','name','qualifications','category','image')

    # def get_imageMemory(request,doctor:Doctor):
    #     with open(doctor.image.name,'rb') as loadedfile:
    #         return base64.b64encode(loadedfile.read())
    #     return