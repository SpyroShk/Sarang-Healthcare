// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportDto _$$_ReportDtoFromJson(Map<String, dynamic> json) => _$_ReportDto(
      id: json['id'] as int,
      userId: json['userId'] as String,
      report: json['report'] as String,
      remarks: json['remarks'] as String,
    );

Map<String, dynamic> _$$_ReportDtoToJson(_$_ReportDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'report': instance.report,
      'remarks': instance.remarks,
    };
