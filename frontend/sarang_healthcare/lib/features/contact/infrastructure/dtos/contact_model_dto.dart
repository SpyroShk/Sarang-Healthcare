import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'contact_model_dto.freezed.dart';
part 'contact_model_dto.g.dart';

@freezed
class ContactModelDto with _$ContactModelDto {
  @HiveType(typeId: 2)
  const factory ContactModelDto({
    @HiveField(0) required int id,
    @HiveField(1) required int phone,
    @HiveField(2) required int mobile,
    @HiveField(3) @Default('') String email,
    @HiveField(4) @Default('') String location,
    @HiveField(5) @Default('') String sm1,
    @HiveField(6) @Default('') String sm2,
    @HiveField(7) @Default('') String sm3,
    @HiveField(8) @Default('') String sm4,
  }) = _ContactModelDto;

  factory ContactModelDto.fromJson(Map<String, dynamic> json) =>
      _$ContactModelDtoFromJson(json);
}
