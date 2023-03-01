// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_testing_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LabTestingDetailDto _$$_LabTestingDetailDtoFromJson(
        Map<String, dynamic> json) =>
    _$_LabTestingDetailDto(
      userId: json['userId'] as String,
      username: json['username'] as String,
      testList: json['testList'] as String,
      collectionDate: json['collectionDate'] as String,
      collectionTime: json['collectionTime'] as String,
      contact: json['contact'] as int,
      patientName: json['patientName'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      userPatientRelation: json['userPatientRelation'] as String,
      service: json['service'] as String,
      city: json['city'] as String,
      address: json['address'] as String,
      landmark: json['landmark'] as String,
    );

Map<String, dynamic> _$$_LabTestingDetailDtoToJson(
        _$_LabTestingDetailDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'testList': instance.testList,
      'collectionDate': instance.collectionDate,
      'collectionTime': instance.collectionTime,
      'contact': instance.contact,
      'patientName': instance.patientName,
      'age': instance.age,
      'gender': instance.gender,
      'userPatientRelation': instance.userPatientRelation,
      'service': instance.service,
      'city': instance.city,
      'address': instance.address,
      'landmark': instance.landmark,
    };
