from django.http.response import HttpResponse
from django.urls import path
from .views import UserDetailAPI,RegisterUserAPIView

def aPage(request):
    return HttpResponse('OK')

urlpatterns = [
  path("get-details",UserDetailAPI.as_view()),
  path('register',RegisterUserAPIView.as_view()),
]