// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChangePasswordModelDto _$$_ChangePasswordModelDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ChangePasswordModelDto(
      old_password: json['old_password'] as String,
      new_password1: json['new_password1'] as String,
      new_password2: json['new_password2'] as String,
    );

Map<String, dynamic> _$$_ChangePasswordModelDtoToJson(
        _$_ChangePasswordModelDto instance) =>
    <String, dynamic>{
      'old_password': instance.old_password,
      'new_password1': instance.new_password1,
      'new_password2': instance.new_password2,
    };
