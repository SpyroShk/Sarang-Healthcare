# Generated by Django 4.1.5 on 2023-02-12 16:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('doctor', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='doctor',
            name='image',
            field=models.ImageField(default='Images/None/No0img.jpg', upload_to='Images/'),
        ),
    ]
