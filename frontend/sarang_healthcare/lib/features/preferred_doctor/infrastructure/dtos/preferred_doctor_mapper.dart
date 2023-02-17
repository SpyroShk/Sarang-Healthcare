import '../../domain/preferred_doctor_model.dart';
import 'preferred_doctor_dto.dart';

class PreferredDoctorMapper {
  static PreferredDoctorModel toPreferredDoctorDetail(
      PreferredDoctorDto preferredDoctorDto) {
    return PreferredDoctorModel(
      id: preferredDoctorDto.id,
      name: preferredDoctorDto.name,
      qualifications: preferredDoctorDto.qualifications,
      category: preferredDoctorDto.category,
      image: preferredDoctorDto.image,
    );
  }

  static PreferredDoctorDto toPreferredDoctorDetailDto(
      PreferredDoctorModel preferredDoctorModel) {
    return PreferredDoctorDto(
      id: preferredDoctorModel.id,
      name: preferredDoctorModel.name,
      qualifications: preferredDoctorModel.qualifications,
      category: preferredDoctorModel.category,
      image: preferredDoctorModel.image,
    );
  }
}
