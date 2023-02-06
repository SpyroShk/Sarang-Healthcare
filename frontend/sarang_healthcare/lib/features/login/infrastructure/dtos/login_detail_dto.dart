import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_detail_dto.freezed.dart';
part 'login_detail_dto.g.dart';

@freezed
class LoginDetailDto with _$LoginDetailDto {
  const factory LoginDetailDto({
    required String username,
    required String password,
  }) = _LoginDetailDto;

  factory LoginDetailDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDetailDtoFromJson(json);
}
