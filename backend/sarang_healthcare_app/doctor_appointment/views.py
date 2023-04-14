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
from rest_framework import generics


class appointmentList(APIView):
    def get(self, request):
        a = request.query_params.get("id")
        b = request.query_params.get("docid")

        if a is not None:
            appointments1 = appointments.objects.filter(user_id=a)
            serializer = appointmentsSerializer(appointments1, many=True)
            return Response(serializer.data)

        if b is not None:
            appointments4 = appointments.objects.filter(doctor_id=b)
            docserializer = appointmentsSerializer(appointments4, many=True)
            return Response(docserializer.data)

        appointments2 = appointments.objects.all()
        serializer2 = appointmentsSerializer(appointments2, many=True)
        return Response(serializer2.data)

    def post(self, request):

        jsonData = JSONParser().parse(request)
        serializer = appointmentsSerializer(data=jsonData)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors)


class AppointmentListView(generics.RetrieveUpdateDestroyAPIView):
    queryset = appointments.objects.all()
    serializer_class = appointmentsSerializer
    lookup_field = 'id'

    def put(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
