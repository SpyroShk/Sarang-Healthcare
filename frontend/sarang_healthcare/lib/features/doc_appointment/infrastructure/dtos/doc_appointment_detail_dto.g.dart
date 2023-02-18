// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doc_appointment_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DocAppointmentDetailDto _$$_DocAppointmentDetailDtoFromJson(
        Map<String, dynamic> json) =>
    _$_DocAppointmentDetailDto(
      userId: json['userId'] as String,
      username: json['username'] as String,
      doctorName: json['doctorName'] as String,
      doctorId: json['doctorId'] as int,
      appointmentDate: DateTime.parse(json['appointmentDate'] as String),
      appointmentTime: DateTime.parse(json['appointmentTime'] as String),
      contact: json['contact'] as int,
      patientName: json['patientName'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      userPatientRelation: json['userPatientRelation'] as String,
    );

Map<String, dynamic> _$$_DocAppointmentDetailDtoToJson(
        _$_DocAppointmentDetailDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'doctorName': instance.doctorName,
      'doctorId': instance.doctorId,
      'appointmentDate': instance.appointmentDate.toIso8601String(),
      'appointmentTime': instance.appointmentTime.toIso8601String(),
      'contact': instance.contact,
      'patientName': instance.patientName,
      'age': instance.age,
      'gender': instance.gender,
      'userPatientRelation': instance.userPatientRelation,
    };
