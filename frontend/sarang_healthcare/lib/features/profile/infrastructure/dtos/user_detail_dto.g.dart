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
      firstName: fields[3] as String,
      lastName: fields[4] as String,
      isDoctor: fields[5] as bool,
      qualifications: fields[6] as String,
      image: fields[7] as String,
      availableFrom: fields[8] as String,
      availableTo: fields[9] as String,
      category: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_UserDetailDto obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.pk)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.firstName)
      ..writeByte(4)
      ..write(obj.lastName)
      ..writeByte(5)
      ..write(obj.isDoctor)
      ..writeByte(6)
      ..write(obj.qualifications)
      ..writeByte(7)
      ..write(obj.image)
      ..writeByte(8)
      ..write(obj.availableFrom)
      ..writeByte(9)
      ..write(obj.availableTo)
      ..writeByte(10)
      ..write(obj.category);
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
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      isDoctor: json['isDoctor'] as bool? ?? false,
      qualifications: json['qualifications'] as String? ?? '',
      image: json['image'] as String? ?? '',
      availableFrom: json['availableFrom'] as String? ?? '',
      availableTo: json['availableTo'] as String? ?? '',
      category: json['category'] as String? ?? '',
    );

Map<String, dynamic> _$$_UserDetailDtoToJson(_$_UserDetailDto instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'username': instance.username,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'isDoctor': instance.isDoctor,
      'qualifications': instance.qualifications,
      'image': instance.image,
      'availableFrom': instance.availableFrom,
      'availableTo': instance.availableTo,
      'category': instance.category,
    };
