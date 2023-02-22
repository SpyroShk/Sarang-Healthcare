// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppointmentListDto _$$_AppointmentListDtoFromJson(
        Map<String, dynamic> json) =>
    _$_AppointmentListDto(
      id: json['id'] as int,
      userId: json['userId'] as String,
      username: json['username'] as String,
      doctorName: json['doctorName'] as String,
      doctorId: json['doctorId'] as int,
      doctorImage: json['doctorImage'] as String,
      doctorCategory: json['doctorCategory'] as String,
      appointmentDate: json['appointmentDate'] as String,
      appointmentTime: json['appointmentTime'] as String,
      contact: json['contact'] as int,
      patientName: json['patientName'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      userPatientRelation: json['userPatientRelation'] as String,
      patientDescription: json['patientDescription'] as String,
    );

Map<String, dynamic> _$$_AppointmentListDtoToJson(
        _$_AppointmentListDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'username': instance.username,
      'doctorName': instance.doctorName,
      'doctorId': instance.doctorId,
      'doctorImage': instance.doctorImage,
      'doctorCategory': instance.doctorCategory,
      'appointmentDate': instance.appointmentDate,
      'appointmentTime': instance.appointmentTime,
      'contact': instance.contact,
      'patientName': instance.patientName,
      'age': instance.age,
      'gender': instance.gender,
      'userPatientRelation': instance.userPatientRelation,
      'patientDescription': instance.patientDescription,
    };
