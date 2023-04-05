import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail.freezed.dart';

@freezed
class UserDetail with _$UserDetail {
  const factory UserDetail({
    required int pk,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required bool isDoctor,
    required String qualifications,
    required String image,
    required String availableFrom,
    required String availableTo,
    required String category,
  }) = _UserDetail;
}
