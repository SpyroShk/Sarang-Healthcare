from django.contrib import admin

# Register your models here.
from .models import Category,Doctor

admin.site.register(Category)
admin.site.register(Doctor)