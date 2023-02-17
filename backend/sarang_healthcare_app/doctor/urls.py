from django.urls import path,include

from .views import DoctorListView

urlpatterns = [
    path('doctorlist',DoctorListView.as_view(),),
]
