from django.db import models
from report.file_type import FileType

class reports(models.Model):
    userId=models.CharField(max_length=300)
    report=FileType(upload_to='uploads/')
    remarks=models.CharField(max_length=600)

    def __str__(self):
        return self.remarks