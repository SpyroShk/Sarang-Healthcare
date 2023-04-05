import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferred_doctor_dto.freezed.dart';
part 'preferred_doctor_dto.g.dart';

@freezed
class PreferredDoctorDto with _$PreferredDoctorDto {
  const factory PreferredDoctorDto({
    required int id,
    required String firstName,
    required String lastName,
    required String qualifications,
    required String category,
    required String image,
    required String availableFrom,
    required String availableTo,
  }) = _PreferredDoctorDto;

  factory PreferredDoctorDto.fromJson(Map<String, dynamic> json) =>
      _$PreferredDoctorDtoFromJson(json);
}

