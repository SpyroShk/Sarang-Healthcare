from django.db import models
from django.core.validators import FileExtensionValidator

class FileType(models.FileField):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.validators.append(FileExtensionValidator(allowed_extensions=['pdf']))

    def deconstruct(self):
        name, path, args, kwargs = super().deconstruct()
        # Remove the validators that were added to the field
        if 'validators' in kwargs:
            del kwargs['validators']
        return name, path, args, kwargs
