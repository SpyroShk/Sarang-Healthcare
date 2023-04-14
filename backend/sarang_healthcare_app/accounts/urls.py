
from django.contrib import admin
from django.urls import path, include
from .views import CategoryListView

urlpatterns = [
    path('', include('dj_rest_auth.urls')),
    # path('passchange/', include('dj_rest_auth.urls.password.reset')),
    # path('passchangeconfirm/', include('dj_rest_auth.urls/password/reset/confirm')),
    path('categoryList', CategoryListView.as_view())
]
