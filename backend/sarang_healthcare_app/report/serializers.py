from rest_framework import serializers
from .models import reports
from report.file_type import FileType

class reportsSerializer(serializers.ModelSerializer):
    report = serializers.SerializerMethodField()
    class Meta:
        model=reports
        fields=('id', 'userId', 'report', 'remarks')
  
    def get_report(self, obj):
        request = self.context.get('request')
        report_url = obj.report.url
        return request.build_absolute_uri(report_url)

    def create(self, validated_data):
        return reports.objects.create(**validated_data)

        
# class reportsSerializer(serializers.ModelSerializer):
#     report=serializers.FileField(max_length=None, use_url=True)
#     class Meta:
#         model=reports
#         fields=('id', 'userId', 'report', 'remarks')
    
#     def create(self, validated_data):
#         return reports.objects.create(**validated_data)