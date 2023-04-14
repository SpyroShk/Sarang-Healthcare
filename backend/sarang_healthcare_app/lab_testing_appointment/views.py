from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.parsers import JSONParser
from .models import labtestings
from .serializers import labtestingsSerializer
from types import NoneType
from rest_framework import generics

class labtestingList(APIView):
    def get(self, request):
        
        a = request.query_params.get("id")
        labtestings2=labtestings.objects.all()
        serializer2=labtestingsSerializer(labtestings2,many=True)
        if(a == None):
            return Response(serializer2.data)
            # return Response({"message" : "error"},status=404)
        labtestings1=labtestings.objects.filter(userId=a)
        serializer=labtestingsSerializer(labtestings1,many=True)
        return Response(serializer.data)
    
    def post(self, request):
      
        jsonData=JSONParser().parse(request)
        serializer=labtestingsSerializer(data=jsonData)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.error)


class LabtestingListView(generics.RetrieveUpdateDestroyAPIView):
    queryset = labtestings.objects.all()
    serializer_class = labtestingsSerializer
    lookup_field = 'id'

    def put(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)