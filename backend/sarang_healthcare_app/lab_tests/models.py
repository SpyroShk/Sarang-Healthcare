from django.db import models

class LabTests(models.Model):
    testName=models.CharField(max_length=500)
    price=models.DecimalField(max_digits=10, decimal_places=2)
    testDescription=models.TextField(default='')

    def __str__(self):
        return self.testName
