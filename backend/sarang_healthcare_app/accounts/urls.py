
from django.contrib import admin
from django.urls import path,include
from .views import CategoryListView

urlpatterns = [
    path('', include('dj_rest_auth.urls')),
    path('categoryList', CategoryListView.as_view())
]