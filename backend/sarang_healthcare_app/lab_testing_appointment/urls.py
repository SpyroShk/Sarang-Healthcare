from django.urls import path,include

from .views import labtestingList

urlpatterns = [
    path('labtestinglist',labtestingList.as_view(),),
]
