// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDetailDto _$UserDetailDtoFromJson(Map<String, dynamic> json) {
  return _UserDetailDto.fromJson(json);
}

/// @nodoc
mixin _$UserDetailDto {
  @HiveField(0)
  int get pk => throw _privateConstructorUsedError;
  @HiveField(1)
  String get username => throw _privateConstructorUsedError;
  @HiveField(2)
  String get email => throw _privateConstructorUsedError;
  @HiveField(3)
  String get firstName => throw _privateConstructorUsedError;
  @HiveField(4)
  String get lastName => throw _privateConstructorUsedError;
  @HiveField(5)
  bool get isDoctor => throw _privateConstructorUsedError;
  @HiveField(6)
  String get qualifications => throw _privateConstructorUsedError;
  @HiveField(7)
  String get image => throw _privateConstructorUsedError;
  @HiveField(8)
  String get availableFrom => throw _privateConstructorUsedError;
  @HiveField(9)
  String get availableTo => throw _privateConstructorUsedError;
  @HiveField(10)
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDetailDtoCopyWith<UserDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailDtoCopyWith<$Res> {
  factory $UserDetailDtoCopyWith(
          UserDetailDto value, $Res Function(UserDetailDto) then) =
      _$UserDetailDtoCopyWithImpl<$Res, UserDetailDto>;
  @useResult
  $Res call(
      {@HiveField(0) int pk,
      @HiveField(1) String username,
      @HiveField(2) String email,
      @HiveField(3) String firstName,
      @HiveField(4) String lastName,
      @HiveField(5) bool isDoctor,
      @HiveField(6) String qualifications,
      @HiveField(7) String image,
      @HiveField(8) String availableFrom,
      @HiveField(9) String availableTo,
      @HiveField(10) String category});
}

/// @nodoc
class _$UserDetailDtoCopyWithImpl<$Res, $Val extends UserDetailDto>
    implements $UserDetailDtoCopyWith<$Res> {
  _$UserDetailDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pk = null,
    Object? username = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? isDoctor = null,
    Object? qualifications = null,
    Object? image = null,
    Object? availableFrom = null,
    Object? availableTo = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      pk: null == pk
          ? _value.pk
          : pk // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      isDoctor: null == isDoctor
          ? _value.isDoctor
          : isDoctor // ignore: cast_nullable_to_non_nullable
              as bool,
      qualifications: null == qualifications
          ? _value.qualifications
          : qualifications // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      availableFrom: null == availableFrom
          ? _value.availableFrom
          : availableFrom // ignore: cast_nullable_to_non_nullable
              as String,
      availableTo: null == availableTo
          ? _value.availableTo
          : availableTo // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDetailDtoCopyWith<$Res>
    implements $UserDetailDtoCopyWith<$Res> {
  factory _$$_UserDetailDtoCopyWith(
          _$_UserDetailDto value, $Res Function(_$_UserDetailDto) then) =
      __$$_UserDetailDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int pk,
      @HiveField(1) String username,
      @HiveField(2) String email,
      @HiveField(3) String firstName,
      @HiveField(4) String lastName,
      @HiveField(5) bool isDoctor,
      @HiveField(6) String qualifications,
      @HiveField(7) String image,
      @HiveField(8) String availableFrom,
      @HiveField(9) String availableTo,
      @HiveField(10) String category});
}

/// @nodoc
class __$$_UserDetailDtoCopyWithImpl<$Res>
    extends _$UserDetailDtoCopyWithImpl<$Res, _$_UserDetailDto>
    implements _$$_UserDetailDtoCopyWith<$Res> {
  __$$_UserDetailDtoCopyWithImpl(
      _$_UserDetailDto _value, $Res Function(_$_UserDetailDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pk = null,
    Object? username = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? isDoctor = null,
    Object? qualifications = null,
    Object? image = null,
    Object? availableFrom = null,
    Object? availableTo = null,
    Object? category = null,
  }) {
    return _then(_$_UserDetailDto(
      pk: null == pk
          ? _value.pk
          : pk // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      isDoctor: null == isDoctor
          ? _value.isDoctor
          : isDoctor // ignore: cast_nullable_to_non_nullable
              as bool,
      qualifications: null == qualifications
          ? _value.qualifications
          : qualifications // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      availableFrom: null == availableFrom
          ? _value.availableFrom
          : availableFrom // ignore: cast_nullable_to_non_nullable
              as String,
      availableTo: null == availableTo
          ? _value.availableTo
          : availableTo // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1)
class _$_UserDetailDto implements _UserDetailDto {
  const _$_UserDetailDto(
      {@HiveField(0) required this.pk,
      @HiveField(1) this.username = '',
      @HiveField(2) this.email = '',
      @HiveField(3) this.firstName = '',
      @HiveField(4) this.lastName = '',
      @HiveField(5) this.isDoctor = false,
      @HiveField(6) this.qualifications = '',
      @HiveField(7) this.image = '',
      @HiveField(8) this.availableFrom = '',
      @HiveField(9) this.availableTo = '',
      @HiveField(10) this.category = ''});

  factory _$_UserDetailDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserDetailDtoFromJson(json);

  @override
  @HiveField(0)
  final int pk;
  @override
  @JsonKey()
  @HiveField(1)
  final String username;
  @override
  @JsonKey()
  @HiveField(2)
  final String email;
  @override
  @JsonKey()
  @HiveField(3)
  final String firstName;
  @override
  @JsonKey()
  @HiveField(4)
  final String lastName;
  @override
  @JsonKey()
  @HiveField(5)
  final bool isDoctor;
  @override
  @JsonKey()
  @HiveField(6)
  final String qualifications;
  @override
  @JsonKey()
  @HiveField(7)
  final String image;
  @override
  @JsonKey()
  @HiveField(8)
  final String availableFrom;
  @override
  @JsonKey()
  @HiveField(9)
  final String availableTo;
  @override
  @JsonKey()
  @HiveField(10)
  final String category;

  @override
  String toString() {
    return 'UserDetailDto(pk: $pk, username: $username, email: $email, firstName: $firstName, lastName: $lastName, isDoctor: $isDoctor, qualifications: $qualifications, image: $image, availableFrom: $availableFrom, availableTo: $availableTo, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDetailDto &&
            (identical(other.pk, pk) || other.pk == pk) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.isDoctor, isDoctor) ||
                other.isDoctor == isDoctor) &&
            (identical(other.qualifications, qualifications) ||
                other.qualifications == qualifications) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.availableFrom, availableFrom) ||
                other.availableFrom == availableFrom) &&
            (identical(other.availableTo, availableTo) ||
                other.availableTo == availableTo) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pk,
      username,
      email,
      firstName,
      lastName,
      isDoctor,
      qualifications,
      image,
      availableFrom,
      availableTo,
      category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDetailDtoCopyWith<_$_UserDetailDto> get copyWith =>
      __$$_UserDetailDtoCopyWithImpl<_$_UserDetailDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDetailDtoToJson(
      this,
    );
  }
}

abstract class _UserDetailDto implements UserDetailDto {
  const factory _UserDetailDto(
      {@HiveField(0) required final int pk,
      @HiveField(1) final String username,
      @HiveField(2) final String email,
      @HiveField(3) final String firstName,
      @HiveField(4) final String lastName,
      @HiveField(5) final bool isDoctor,
      @HiveField(6) final String qualifications,
      @HiveField(7) final String image,
      @HiveField(8) final String availableFrom,
      @HiveField(9) final String availableTo,
      @HiveField(10) final String category}) = _$_UserDetailDto;

  factory _UserDetailDto.fromJson(Map<String, dynamic> json) =
      _$_UserDetailDto.fromJson;

  @override
  @HiveField(0)
  int get pk;
  @override
  @HiveField(1)
  String get username;
  @override
  @HiveField(2)
  String get email;
  @override
  @HiveField(3)
  String get firstName;
  @override
  @HiveField(4)
  String get lastName;
  @override
  @HiveField(5)
  bool get isDoctor;
  @override
  @HiveField(6)
  String get qualifications;
  @override
  @HiveField(7)
  String get image;
  @override
  @HiveField(8)
  String get availableFrom;
  @override
  @HiveField(9)
  String get availableTo;
  @override
  @HiveField(10)
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$_UserDetailDtoCopyWith<_$_UserDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}
