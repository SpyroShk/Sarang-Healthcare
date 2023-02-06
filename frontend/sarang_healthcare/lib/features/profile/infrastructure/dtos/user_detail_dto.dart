import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_detail_dto.freezed.dart';
part 'user_detail_dto.g.dart';

@freezed
class UserDetailDto with _$UserDetailDto {
  @HiveType(typeId: 1)
  const factory UserDetailDto({
    @HiveField(0) required int pk,
    @HiveField(1) @Default('') String username,
    @HiveField(2) @Default('') String email,
  }) = _UserDetailDto;

  factory UserDetailDto.fromJson(Map<String, dynamic> json) =>
      _$UserDetailDtoFromJson(json);
}
