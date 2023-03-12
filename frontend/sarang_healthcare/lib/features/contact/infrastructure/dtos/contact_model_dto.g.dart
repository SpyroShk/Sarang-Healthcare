// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactModelDtoAdapter extends TypeAdapter<_$_ContactModelDto> {
  @override
  final int typeId = 2;

  @override
  _$_ContactModelDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ContactModelDto(
      id: fields[0] as int,
      phone: fields[1] as int,
      mobile: fields[2] as int,
      email: fields[3] as String,
      location: fields[4] as String,
      sm1: fields[5] as String,
      sm2: fields[6] as String,
      sm3: fields[7] as String,
      sm4: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ContactModelDto obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.mobile)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.sm1)
      ..writeByte(6)
      ..write(obj.sm2)
      ..writeByte(7)
      ..write(obj.sm3)
      ..writeByte(8)
      ..write(obj.sm4);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactModelDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContactModelDto _$$_ContactModelDtoFromJson(Map<String, dynamic> json) =>
    _$_ContactModelDto(
      id: json['id'] as int,
      phone: json['phone'] as int,
      mobile: json['mobile'] as int,
      email: json['email'] as String? ?? '',
      location: json['location'] as String? ?? '',
      sm1: json['sm1'] as String? ?? '',
      sm2: json['sm2'] as String? ?? '',
      sm3: json['sm3'] as String? ?? '',
      sm4: json['sm4'] as String? ?? '',
    );

Map<String, dynamic> _$$_ContactModelDtoToJson(_$_ContactModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'mobile': instance.mobile,
      'email': instance.email,
      'location': instance.location,
      'sm1': instance.sm1,
      'sm2': instance.sm2,
      'sm3': instance.sm3,
      'sm4': instance.sm4,
    };
