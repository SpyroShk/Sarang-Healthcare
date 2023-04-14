import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_model_dto.freezed.dart';
part 'change_password_model_dto.g.dart';

@freezed
class ChangePasswordModelDto with _$ChangePasswordModelDto {
  const factory ChangePasswordModelDto({
    required String old_password,
    required String new_password1,
    required String new_password2,
  }) = _ChangePasswordModelDto;

  factory ChangePasswordModelDto.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordModelDtoFromJson(json);
}
