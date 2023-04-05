from accounts.models import User
from django.http import JsonResponse
from django.views import View


class DoctorListView(View):
    def get(self, request):
        doctors = User.objects.filter(isDoctor=True)
        doctor_list = []
        for doctor in doctors:
            doctor_list.append({
                'id': doctor.pk,
                'email': doctor.email,
                'firstName': doctor.first_name,
                'lastName': doctor.last_name,
                'isDoctor': doctor.isDoctor,
                'qualifications': doctor.qualifications,
                'username': doctor.username,
                'image': doctor.image.name,
                'availableFrom': doctor.availableFrom,
                'availableTo': doctor.availableTo,
                'category': doctor.category.name,
                'groups': doctor.groups.name,
            })
        return JsonResponse(doctor_list, safe=False)
