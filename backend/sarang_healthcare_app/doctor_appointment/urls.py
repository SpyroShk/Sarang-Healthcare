from django.urls import path, include

from .views import appointmentList, AppointmentListView

urlpatterns = [
    path('appointmentlist', appointmentList.as_view(),),
    path('appointmentlist/<int:id>/', AppointmentListView.as_view()),
]
