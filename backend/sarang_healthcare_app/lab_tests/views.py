from django.shortcuts import render

from rest_framework import generics
from .models import LabTests
from .serializers import LabTestsSerializer

class LabTestsView(generics.ListAPIView):
    queryset=LabTests.objects.all()
    serializer_class=LabTestsSerializer
    