// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_success.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContactSuccess {
  ContactModel get apiData => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ContactModel apiData) network,
    required TResult Function(ContactModel apiData) cache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ContactModel apiData)? network,
    TResult? Function(ContactModel apiData)? cache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ContactModel apiData)? network,
    TResult Function(ContactModel apiData)? cache,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Cache value) cache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_Cache value)? cache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Cache value)? cache,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactSuccessCopyWith<ContactSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactSuccessCopyWith<$Res> {
  factory $ContactSuccessCopyWith(
          ContactSuccess value, $Res Function(ContactSuccess) then) =
      _$ContactSuccessCopyWithImpl<$Res, ContactSuccess>;
  @useResult
  $Res call({ContactModel apiData});

  $ContactModelCopyWith<$Res> get apiData;
}

/// @nodoc
class _$ContactSuccessCopyWithImpl<$Res, $Val extends ContactSuccess>
    implements $ContactSuccessCopyWith<$Res> {
  _$ContactSuccessCopyWithImpl(this._value, this._then);

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
              as ContactModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactModelCopyWith<$Res> get apiData {
    return $ContactModelCopyWith<$Res>(_value.apiData, (value) {
      return _then(_value.copyWith(apiData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NetworkCopyWith<$Res>
    implements $ContactSuccessCopyWith<$Res> {
  factory _$$_NetworkCopyWith(
          _$_Network value, $Res Function(_$_Network) then) =
      __$$_NetworkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ContactModel apiData});

  @override
  $ContactModelCopyWith<$Res> get apiData;
}

/// @nodoc
class __$$_NetworkCopyWithImpl<$Res>
    extends _$ContactSuccessCopyWithImpl<$Res, _$_Network>
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
          ? _value.apiData
          : apiData // ignore: cast_nullable_to_non_nullable
              as ContactModel,
    ));
  }
}

/// @nodoc

class _$_Network implements _Network {
  const _$_Network({required this.apiData});

  @override
  final ContactModel apiData;

  @override
  String toString() {
    return 'ContactSuccess.network(apiData: $apiData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Network &&
            (identical(other.apiData, apiData) || other.apiData == apiData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetworkCopyWith<_$_Network> get copyWith =>
      __$$_NetworkCopyWithImpl<_$_Network>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ContactModel apiData) network,
    required TResult Function(ContactModel apiData) cache,
  }) {
    return network(apiData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ContactModel apiData)? network,
    TResult? Function(ContactModel apiData)? cache,
  }) {
    return network?.call(apiData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ContactModel apiData)? network,
    TResult Function(ContactModel apiData)? cache,
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
    required TResult Function(_Cache value) cache,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_Cache value)? cache,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Cache value)? cache,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class _Network implements ContactSuccess {
  const factory _Network({required final ContactModel apiData}) = _$_Network;

  @override
  ContactModel get apiData;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkCopyWith<_$_Network> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CacheCopyWith<$Res>
    implements $ContactSuccessCopyWith<$Res> {
  factory _$$_CacheCopyWith(_$_Cache value, $Res Function(_$_Cache) then) =
      __$$_CacheCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ContactModel apiData});

  @override
  $ContactModelCopyWith<$Res> get apiData;
}

/// @nodoc
class __$$_CacheCopyWithImpl<$Res>
    extends _$ContactSuccessCopyWithImpl<$Res, _$_Cache>
    implements _$$_CacheCopyWith<$Res> {
  __$$_CacheCopyWithImpl(_$_Cache _value, $Res Function(_$_Cache) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiData = null,
  }) {
    return _then(_$_Cache(
      apiData: null == apiData
          ? _value.apiData
          : apiData // ignore: cast_nullable_to_non_nullable
              as ContactModel,
    ));
  }
}

/// @nodoc

class _$_Cache implements _Cache {
  const _$_Cache({required this.apiData});

  @override
  final ContactModel apiData;

  @override
  String toString() {
    return 'ContactSuccess.cache(apiData: $apiData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cache &&
            (identical(other.apiData, apiData) || other.apiData == apiData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CacheCopyWith<_$_Cache> get copyWith =>
      __$$_CacheCopyWithImpl<_$_Cache>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ContactModel apiData) network,
    required TResult Function(ContactModel apiData) cache,
  }) {
    return cache(apiData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ContactModel apiData)? network,
    TResult? Function(ContactModel apiData)? cache,
  }) {
    return cache?.call(apiData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ContactModel apiData)? network,
    TResult Function(ContactModel apiData)? cache,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(apiData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Cache value) cache,
  }) {
    return cache(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_Cache value)? cache,
  }) {
    return cache?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Cache value)? cache,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(this);
    }
    return orElse();
  }
}

abstract class _Cache implements ContactSuccess {
  const factory _Cache({required final ContactModel apiData}) = _$_Cache;

  @override
  ContactModel get apiData;
  @override
  @JsonKey(ignore: true)
  _$$_CacheCopyWith<_$_Cache> get copyWith =>
      throw _privateConstructorUsedError;
}
