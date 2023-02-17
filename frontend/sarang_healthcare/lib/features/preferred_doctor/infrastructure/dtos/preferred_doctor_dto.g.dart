// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferred_doctor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PreferredDoctorDto _$$_PreferredDoctorDtoFromJson(
        Map<String, dynamic> json) =>
    _$_PreferredDoctorDto(
      id: json['id'] as int,
      name: json['name'] as String,
      qualifications: json['qualifications'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$_PreferredDoctorDtoToJson(
        _$_PreferredDoctorDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'qualifications': instance.qualifications,
      'category': instance.category,
      'image': instance.image,
    };
