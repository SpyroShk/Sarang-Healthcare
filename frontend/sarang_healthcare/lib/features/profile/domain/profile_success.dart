import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_detail.dart';

part 'profile_success.freezed.dart';

@freezed
class ProfileSuccess with _$ProfileSuccess {
  const factory ProfileSuccess.network({required UserDetail apiData}) =
      _Network;
  const factory ProfileSuccess.cache({required UserDetail apiData}) = _Cache;
}
