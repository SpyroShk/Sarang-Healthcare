// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferred_doctor_success.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PreferredDoctorSuccess {
  List<PreferredDoctorModel> get apiData => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PreferredDoctorModel> apiData) network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PreferredDoctorModel> apiData)? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PreferredDoctorModel> apiData)? network,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PreferredDoctorSuccessCopyWith<PreferredDoctorSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferredDoctorSuccessCopyWith<$Res> {
  factory $PreferredDoctorSuccessCopyWith(PreferredDoctorSuccess value,
          $Res Function(PreferredDoctorSuccess) then) =
      _$PreferredDoctorSuccessCopyWithImpl<$Res, PreferredDoctorSuccess>;
  @useResult
  $Res call({List<PreferredDoctorModel> apiData});
}

/// @nodoc
class _$PreferredDoctorSuccessCopyWithImpl<$Res,
        $Val extends PreferredDoctorSuccess>
    implements $PreferredDoctorSuccessCopyWith<$Res> {
  _$PreferredDoctorSuccessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiData = null,
  }) {
    return _then(_value.copyWith(
      apiData: null == apiData
          ? _value.apiData
          : apiData // ignore: cast_nullable_to_non_nullable
              as List<PreferredDoctorModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NetworkCopyWith<$Res>
    implements $PreferredDoctorSuccessCopyWith<$Res> {
  factory _$$_NetworkCopyWith(
          _$_Network value, $Res Function(_$_Network) then) =
      __$$_NetworkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PreferredDoctorModel> apiData});
}

/// @nodoc
class __$$_NetworkCopyWithImpl<$Res>
    extends _$PreferredDoctorSuccessCopyWithImpl<$Res, _$_Network>
    implements _$$_NetworkCopyWith<$Res> {
  __$$_NetworkCopyWithImpl(_$_Network _value, $Res Function(_$_Network) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiData = null,
  }) {
    return _then(_$_Network(
      apiData: null == apiData
          ? _value._apiData
          : apiData // ignore: cast_nullable_to_non_nullable
              as List<PreferredDoctorModel>,
    ));
  }
}

/// @nodoc

class _$_Network implements _Network {
  const _$_Network({required final List<PreferredDoctorModel> apiData})
      : _apiData = apiData;

  final List<PreferredDoctorModel> _apiData;
  @override
  List<PreferredDoctorModel> get apiData {
    if (_apiData is EqualUnmodifiableListView) return _apiData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_apiData);
  }

  @override
  String toString() {
    return 'PreferredDoctorSuccess.network(apiData: $apiData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Network &&
            const DeepCollectionEquality().equals(other._apiData, _apiData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_apiData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetworkCopyWith<_$_Network> get copyWith =>
      __$$_NetworkCopyWithImpl<_$_Network>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PreferredDoctorModel> apiData) network,
  }) {
    return network(apiData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PreferredDoctorModel> apiData)? network,
  }) {
    return network?.call(apiData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PreferredDoctorModel> apiData)? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(apiData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class _Network implements PreferredDoctorSuccess {
  const factory _Network({required final List<PreferredDoctorModel> apiData}) =
      _$_Network;

  @override
  List<PreferredDoctorModel> get apiData;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkCopyWith<_$_Network> get copyWith =>
      throw _privateConstructorUsedError;
}
