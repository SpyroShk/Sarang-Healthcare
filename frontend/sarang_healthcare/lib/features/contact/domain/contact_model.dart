import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_model.freezed.dart';

@freezed
class ContactModel with _$ContactModel {
  const factory ContactModel({
    required int id,
    required int phone,
    required int mobile,
    required String email,
    required String location,
    required String sm1,
    required String sm2,
    required String sm3,
    required String sm4,
  }) = _ContactModel;
}
