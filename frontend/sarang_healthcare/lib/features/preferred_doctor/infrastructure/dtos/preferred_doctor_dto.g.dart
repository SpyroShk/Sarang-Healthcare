// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferred_doctor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PreferredDoctorDto _$$_PreferredDoctorDtoFromJson(
        Map<String, dynamic> json) =>
    _$_PreferredDoctorDto(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      qualifications: json['qualifications'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      availableFrom: json['availableFrom'] as String,
      availableTo: json['availableTo'] as String,
    );

Map<String, dynamic> _$$_PreferredDoctorDtoToJson(
        _$_PreferredDoctorDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'qualifications': instance.qualifications,
      'category': instance.category,
      'image': instance.image,
      'availableFrom': instance.availableFrom,
      'availableTo': instance.availableTo,
    };
