# Generated by Django 4.1.5 on 2023-04-03 16:43

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    initial = True

    dependencies = [
        ("auth", "0012_alter_user_first_name_max_length"),
    ]

    operations = [
        migrations.CreateModel(
            name="Category",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=500)),
            ],
        ),
        migrations.CreateModel(
            name="User",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("password", models.CharField(max_length=128, verbose_name="password")),
                (
                    "last_login",
                    models.DateTimeField(
                        blank=True, null=True, verbose_name="last login"
                    ),
                ),
                ("username", models.CharField(default="", max_length=254, unique=True)),
                (
                    "email",
                    models.EmailField(db_index=True, max_length=254, unique=True),
                ),
                ("first_name", models.CharField(max_length=250)),
                ("last_name", models.CharField(max_length=250)),
                ("isDoctor", models.BooleanField(default=False)),
                (
                    "image",
                    models.ImageField(
                        default="/media/Images/doc.jpg", null=True, upload_to="Images/"
                    ),
                ),
                (
                    "qualifications",
                    models.CharField(blank=True, max_length=200, null=True),
                ),
                ("availableFrom", models.TimeField(blank=True, null=True)),
                ("availableTo", models.TimeField(blank=True, null=True)),
                ("date_joined", models.DateTimeField(blank=True, null=True)),
                ("is_staff", models.BooleanField(default=False)),
                ("is_active", models.BooleanField(default=True)),
                ("is_superuser", models.BooleanField(default=False)),
                (
                    "category",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.PROTECT,
                        to="accounts.category",
                    ),
                ),
                (
                    "groups",
                    models.ManyToManyField(
                        blank=True,
                        help_text="The groups this user belongs to. A user will get all permissions granted to each of their groups.",
                        related_name="user_set",
                        related_query_name="user",
                        to="auth.group",
                        verbose_name="groups",
                    ),
                ),
                (
                    "user_permissions",
                    models.ManyToManyField(
                        blank=True,
                        help_text="Specific permissions for this user.",
                        related_name="user_set",
                        related_query_name="user",
                        to="auth.permission",
                        verbose_name="user permissions",
                    ),
                ),
            ],
            options={
                "verbose_name": "User",
                "verbose_name_plural": "Users",
            },
        ),
    ]
