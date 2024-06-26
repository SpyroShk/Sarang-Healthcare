"""settings URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings
from accounts.views import CustomLoginView, CustomUserInfoView
from dj_rest_auth.views import PasswordResetView, PasswordResetConfirmView

urlpatterns = [
    # path('jet/', include('jet.urls', 'jet')),

    path('admin/', admin.site.urls),
    # path(' ', admin.site.urls),
    path('core/', include('core.urls')),
    path('accounts/', include('accounts.urls')),
    path('registration/', include('dj_rest_auth.registration.urls')),
    path('login/', CustomLoginView.as_view()),
    path('account/', include('allauth.urls')),
    path('user/details/', CustomUserInfoView.as_view(), name='user_details'),
    path('category/', include('accounts.urls')),
    path('doctors/', include('doctors.urls')),
    path('category/', include('accounts.urls')),
    path('appointments/', include('doctor_appointment.urls')),
    path('doctor/', include('doctor.urls')),
    path('', include('contact.urls')),
    path('labtests/', include('lab_tests.urls')),
    path('reports/', include('report.urls')),
    path('labtestingappointments/', include('lab_testing_appointment.urls')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
