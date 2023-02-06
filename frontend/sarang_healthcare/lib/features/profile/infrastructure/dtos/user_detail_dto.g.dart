// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDetailDtoAdapter extends TypeAdapter<_$_UserDetailDto> {
  @override
  final int typeId = 1;

  @override
  _$_UserDetailDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_UserDetailDto(
      pk: fields[0] as int,
      username: fields[1] as String,
      email: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_UserDetailDto obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.pk)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDetailDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDetailDto _$$_UserDetailDtoFromJson(Map<String, dynamic> json) =>
    _$_UserDetailDto(
      pk: json['pk'] as int,
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$$_UserDetailDtoToJson(_$_UserDetailDto instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'username': instance.username,
      'email': instance.email,
    };
