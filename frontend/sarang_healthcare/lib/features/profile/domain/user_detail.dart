import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail.freezed.dart';

@freezed
class UserDetail with _$UserDetail {
  const factory UserDetail({
    required int pk,
    required String username,
    required String email,
  }) = _UserDetail;
}
