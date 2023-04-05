from django.urls import path, include

from .views import ContactListView

urlpatterns = [
    path('contact/<int:id>/', ContactListView.as_view(), name='contact-detail'),
]
