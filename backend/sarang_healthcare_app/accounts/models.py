
from django.contrib.auth import get_user_model
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin, BaseUserManager

# Create your models here.


class CustomUserManager(BaseUserManager):
    def _create_user(self, email, password, first_name, last_name, **extra_fields):
        if not email:
            raise ValueError("Email must be provided")
        if not password:
            raise ValueError('Password is not provided')

        user = self.model(
            email=self.normalize_email(email),
            first_name=first_name,
            last_name=last_name,
            **extra_fields
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, email, password, first_name, last_name, **extra_fields):
        extra_fields.setdefault('is_staff', False)
        extra_fields.setdefault('is_active', True)
        extra_fields.setdefault('is_superuser', False)
        return self._create_user(email, password, first_name, last_name, **extra_fields)

    def create_superuser(self, email, password, first_name, last_name, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_active', True)
        extra_fields.setdefault('is_superuser', True)
        return self._create_user(email, password, first_name, last_name, **extra_fields)



class Category(models.Model):
    name = models.CharField(max_length=500)

    def __str__(self):
        return self.name


class User(AbstractBaseUser, PermissionsMixin):
    username = models.CharField(unique=True, max_length=254, default='')
    email = models.EmailField(db_index=True, unique=True, max_length=254)
    first_name = models.CharField(max_length=250)
    last_name = models.CharField(max_length=250)
    isDoctor = models.BooleanField(default=False)
    category = models.ForeignKey(Category, on_delete=models.PROTECT, null=True, blank=True)
    image = models.ImageField(null=True,
                              upload_to='Images/', default='/Images/placeholder.jpg')
    qualifications = models.CharField(max_length=200, null=True, blank=True)
    availableFrom = models.TimeField(null=True, blank=True)
    availableTo = models.TimeField(null=True, blank=True)
    date_joined = models.DateTimeField(null=True, blank=True)

    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_superuser = models.BooleanField(default=False)

    objects = CustomUserManager()

    USERNAME_FIELD = 'email'

    REQUIRED_FIELDS = ['first_name', 'last_name']

    class Meta:
        verbose_name = 'User'
        verbose_name_plural = 'Users'

    # def name(self):
    #     return self.first_name + ' ' + self.last_name

    def __str__(self):
        return self.username

