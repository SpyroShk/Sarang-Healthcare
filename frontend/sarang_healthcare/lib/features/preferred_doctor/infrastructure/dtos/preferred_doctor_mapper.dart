import '../../domain/preferred_doctor_model.dart';
import 'preferred_doctor_dto.dart';

class PreferredDoctorMapper {
  static PreferredDoctorModel toPreferredDoctorDetail(
      PreferredDoctorDto preferredDoctorDto) {
    return PreferredDoctorModel(
      id: preferredDoctorDto.id,
      firstName: preferredDoctorDto.firstName,
      lastName: preferredDoctorDto.lastName,
      qualifications: preferredDoctorDto.qualifications,
      category: preferredDoctorDto.category,
      image: preferredDoctorDto.image,
      availableFrom: preferredDoctorDto.availableFrom,
      availableTo: preferredDoctorDto.availableTo,
    );
  }

  static PreferredDoctorDto toPreferredDoctorDetailDto(
      PreferredDoctorModel preferredDoctorModel) {
    return PreferredDoctorDto(
      id: preferredDoctorModel.id,
      firstName: preferredDoctorModel.firstName,
      lastName: preferredDoctorModel.lastName,
      qualifications: preferredDoctorModel.qualifications,
      category: preferredDoctorModel.category,
      image: preferredDoctorModel.image,
      availableFrom: preferredDoctorModel.availableFrom,
      availableTo: preferredDoctorModel.availableTo,
    );
  }
}
