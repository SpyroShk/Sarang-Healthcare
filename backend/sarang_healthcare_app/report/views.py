from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.parsers import JSONParser
from .models import reports
from .serializers import reportsSerializer
from types import NoneType

class reportList(APIView):
    def get(self, request):
        a = request.query_params.get("id")
        reports2=reports.objects.all()
        serializer2=reportsSerializer(reports2,many=True, context={'request': request})
        if(a == None):
            return Response(serializer2.data)
        reports1=reports.objects.filter(userId=a)
        serializer=reportsSerializer(reports1,many=True, context={'request': request})
        return Response(serializer.data)
    
    def post(self, request):
        jsonData=JSONParser().parse(request)
        serializer=reportsSerializer(data=jsonData, context={'request': request})
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors)



# class reportList(APIView):
#     def get(self, request):
        
#         a = request.query_params.get("id")
#         reports2=reports.objects.all()
#         serializer2=reportsSerializer(reports2,many=True)
#         if(a == None):
#             return Response(serializer2.data)
#         reports1=reports.objects.filter(userId=a)
#         serializer=reportsSerializer(reports1,many=True)
#         return Response(serializer.data)
    
#     def post(self, request):
        
#         jsonData=JSONParser().parse(request)
#         serializer=reportsSerializer(data=jsonData)
#         if serializer.is_valid():
#             serializer.save()
#             return Response(serializer.data)
#         else:
#             return Response(serializer.error)


# class reportList(APIView):
#     serializer_class = reportsSerializer
    
#     def get_queryset(self):
#         queryset = reports.objects.all()
#         id = self.request.query_params.get("id")
#         if id is not None:
#             queryset = queryset.filter(userId=id)
#         return queryset
    
#     def get(self, request):
#         queryset = self.get_queryset()
#         serializer = self.serializer_class(queryset, many=True)
#         return Response(serializer.data)
    
#     def post(self, request):
#         serializer = self.serializer_class(data=request.data)
#         if serializer.is_valid():
#             serializer.save()
#             return Response(serializer.data, status=status.HTTP_201_CREATED)
#         else:
#             return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)