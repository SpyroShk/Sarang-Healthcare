import 'package:freezed_annotation/freezed_annotation.dart';

import 'contact_model.dart';

part 'contact_success.freezed.dart';

@freezed
class ContactSuccess with _$ContactSuccess {
  const factory ContactSuccess.network({required List<ContactModel> apiData}) =
      _Network;
  const factory ContactSuccess.cache({required List<ContactModel> apiData}) = _Cache;
}
