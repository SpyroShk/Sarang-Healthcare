import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferred_doctor_dto.freezed.dart';
part 'preferred_doctor_dto.g.dart';

@freezed
class PreferredDoctorDto with _$PreferredDoctorDto {
  const factory PreferredDoctorDto({
    required int id,
    required String name,
    required String qualifications,
    required String category,
    required String image,
  }) = _PreferredDoctorDto;

  factory PreferredDoctorDto.fromJson(Map<String, dynamic> json) =>
      _$PreferredDoctorDtoFromJson(json);
}

// class PreferredDoctorDto with _$PreferredDoctorDto {
//   @HiveType(typeId: 2)
//   const factory PreferredDoctorDto({
//     @HiveField(0) required int id,
//     @HiveField(1) @Default('') String name,
//     @HiveField(2) @Default('') String qualifications,
//     @HiveField(3) @Default('') String category,
//     @HiveField(4) @Default('') String imageUrl,
//     @HiveField(5) @Uint8ListConverter() Uint8List? imageMemory,
//   }) = _PreferredDoctorDto;

//   factory PreferredDoctorDto.fromJson(Map<String, dynamic> json) =>
//       _$PreferredDoctorDtoFromJson(json);
// }

// class Uint8ListConverter implements JsonConverter<Uint8List?, List<int>?> {
//   const Uint8ListConverter();

//   @override
//   Uint8List? fromJson(List<int>? json) {
//     return json == null ? null : Uint8List.fromList(json);
//   }

//   @override
//   List<int>? toJson(Uint8List? object) {
//     return object?.toList();
//   }
// }
