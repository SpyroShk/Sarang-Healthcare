import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_detail_dto.freezed.dart';
part 'signup_detail_dto.g.dart';

@freezed
class SignupDetailDto with _$SignupDetailDto {
  const factory SignupDetailDto({
    required String username,
    required String email,
    required String password1,
    required String password2,
  }) = _SignupDetailDto;

  factory SignupDetailDto.fromJson(Map<String, dynamic> json) =>
      _$SignupDetailDtoFromJson(json);
}
