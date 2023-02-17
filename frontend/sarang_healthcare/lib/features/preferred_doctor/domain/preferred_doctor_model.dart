import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferred_doctor_model.freezed.dart';

@freezed
class PreferredDoctorModel with _$PreferredDoctorModel {
  const factory PreferredDoctorModel({
    required int id,
    required String name,
    required String qualifications,
    required String category,
    required String image,
  }) = _PreferredDoctorModel;
}
