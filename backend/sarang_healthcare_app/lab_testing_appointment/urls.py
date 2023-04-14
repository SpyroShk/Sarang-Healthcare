from django.urls import path, include

from .views import labtestingList, LabtestingListView

urlpatterns = [
    path('labtestinglist', labtestingList.as_view(),),
    path('labtestinglist/<int:id>/', LabtestingListView.as_view()),
]
