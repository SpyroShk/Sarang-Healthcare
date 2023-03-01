from django.urls import path,include

from .views import LabTestsView

urlpatterns = [
    path('labtestslist',LabTestsView.as_view(),),
]
