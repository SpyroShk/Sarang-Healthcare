from django.urls import path,include

from .views import ContactListView

urlpatterns = [
    path('contactlist',ContactListView.as_view(),),
]
