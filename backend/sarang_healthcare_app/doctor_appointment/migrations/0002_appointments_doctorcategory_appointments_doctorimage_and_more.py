# Generated by Django 4.1.5 on 2023-02-20 11:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('doctor_appointment', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='appointments',
            name='doctorCategory',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AddField(
            model_name='appointments',
            name='doctorImage',
            field=models.CharField(default='', max_length=600),
        ),
        migrations.AddField(
            model_name='appointments',
            name='patientDescription',
            field=models.TextField(default=''),
        ),
    ]