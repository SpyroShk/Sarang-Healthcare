from django.contrib.auth import authenticate
from dj_rest_auth.views import LoginView
from dj_rest_auth.views import UserDetailsView
from rest_framework import status, viewsets
from rest_framework.response import Response
from django.shortcuts import render
from .models import Category

from rest_framework import generics
from .serializers import CategorySerializer


class CategoryListView(generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer


class CustomLoginView(LoginView):
    def get_response(self):
        response = super().get_response()
        # add additional data to the response
        response.data['isStaff'] = self.user.is_staff
        response.data['isDoctor'] = self.user.isDoctor
        return response


class CustomUserInfoView(UserDetailsView):
    def get(self, request, *args, **kwargs):
        user_data = super().get(request, *args, **kwargs).data
        user_data['firstName'] = request.user.first_name
        user_data['lastName'] = request.user.last_name
        user_data['isDoctor'] = request.user.isDoctor
        user_data['qualifications'] = request.user.qualifications
        user_data['username'] = request.user.username
        user_data['image'] = request.user.image.name
        user_data['availableFrom'] = request.user.availableFrom
        user_data['availableTo'] = request.user.availableTo
        if request.user.category is not None:
            user_data['category'] = request.user.category.name
        else:
            user_data['category'] = None
        return Response(user_data)
