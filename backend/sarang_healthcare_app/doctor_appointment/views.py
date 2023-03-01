from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.parsers import JSONParser
from .models import appointments
from .serializers import appointmentsSerializer
from types import NoneType

class appointmentList(APIView):
    def get(self, request):
        
        a = request.query_params.get("id")
        appointments2=appointments.objects.all()
        serializer2=appointmentsSerializer(appointments2,many=True)
        if(a == None):
            return Response(serializer2.data)
            # return Response({"message" : "error"},status=404)
        appointments1=appointments.objects.filter(user_id=a)
        serializer=appointmentsSerializer(appointments1,many=True)
        return Response(serializer.data)
    
    def post(self, request):
        
        jsonData=JSONParser().parse(request)
        serializer=appointmentsSerializer(data=jsonData)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.error)