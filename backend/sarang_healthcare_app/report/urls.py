from django.urls import path,include

from .views import reportList

urlpatterns = [
    path('reportlist',reportList.as_view(),),
]
