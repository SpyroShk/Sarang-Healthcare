from django.urls import path,include

from .views import appointmentList

urlpatterns = [
    path('appointmentlist',appointmentList.as_view(),),
]
