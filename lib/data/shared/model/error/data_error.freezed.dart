// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DataError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error) unknown,
    required TResult Function(String? reason) apiError,
    required TResult Function(String? reason) authError,
    required TResult Function() error404,
    required TResult Function(DecoderErrorSearchApiModel? data)
        decoderErrorSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error)? unknown,
    TResult? Function(String? reason)? apiError,
    TResult? Function(String? reason)? authError,
    TResult? Function()? error404,
    TResult? Function(DecoderErrorSearchApiModel? data)? decoderErrorSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? unknown,
    TResult Function(String? reason)? apiError,
    TResult Function(String? reason)? authError,
    TResult Function()? error404,
    TResult Function(DecoderErrorSearchApiModel? data)? decoderErrorSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_unknown value) unknown,
    required TResult Function(_apiError value) apiError,
    required TResult Function(_authError value) authError,
    required TResult Function(_error404 value) error404,
    required TResult Function(_decoderErrorSearch value) decoderErrorSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_unknown value)? unknown,
    TResult? Function(_apiError value)? apiError,
    TResult? Function(_authError value)? authError,
    TResult? Function(_error404 value)? error404,
    TResult? Function(_decoderErrorSearch value)? decoderErrorSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_unknown value)? unknown,
    TResult Function(_apiError value)? apiError,
    TResult Function(_authError value)? authError,
    TResult Function(_error404 value)? error404,
    TResult Function(_decoderErrorSearch value)? decoderErrorSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataErrorCopyWith<$Res> {
  factory $DataErrorCopyWith(DataError value, $Res Function(DataError) then) =
      _$DataErrorCopyWithImpl<$Res, DataError>;
}

/// @nodoc
class _$DataErrorCopyWithImpl<$Res, $Val extends DataError>
    implements $DataErrorCopyWith<$Res> {
  _$DataErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$unknownImplCopyWith<$Res> {
  factory _$$unknownImplCopyWith(
          _$unknownImpl value, $Res Function(_$unknownImpl) then) =
      __$$unknownImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$unknownImplCopyWithImpl<$Res>
    extends _$DataErrorCopyWithImpl<$Res, _$unknownImpl>
    implements _$$unknownImplCopyWith<$Res> {
  __$$unknownImplCopyWithImpl(
      _$unknownImpl _value, $Res Function(_$unknownImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$unknownImpl(
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$unknownImpl implements _unknown {
  const _$unknownImpl({this.error});

  @override
  final Object? error;

  @override
  String toString() {
    return 'DataError.unknown(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$unknownImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$unknownImplCopyWith<_$unknownImpl> get copyWith =>
      __$$unknownImplCopyWithImpl<_$unknownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error) unknown,
    required TResult Function(String? reason) apiError,
    required TResult Function(String? reason) authError,
    required TResult Function() error404,
    required TResult Function(DecoderErrorSearchApiModel? data)
        decoderErrorSearch,
  }) {
    return unknown(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error)? unknown,
    TResult? Function(String? reason)? apiError,
    TResult? Function(String? reason)? authError,
    TResult? Function()? error404,
    TResult? Function(DecoderErrorSearchApiModel? data)? decoderErrorSearch,
  }) {
    return unknown?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? unknown,
    TResult Function(String? reason)? apiError,
    TResult Function(String? reason)? authError,
    TResult Function()? error404,
    TResult Function(DecoderErrorSearchApiModel? data)? decoderErrorSearch,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_unknown value) unknown,
    required TResult Function(_apiError value) apiError,
    required TResult Function(_authError value) authError,
    required TResult Function(_error404 value) error404,
    required TResult Function(_decoderErrorSearch value) decoderErrorSearch,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_unknown value)? unknown,
    TResult? Function(_apiError value)? apiError,
    TResult? Function(_authError value)? authError,
    TResult? Function(_error404 value)? error404,
    TResult? Function(_decoderErrorSearch value)? decoderErrorSearch,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_unknown value)? unknown,
    TResult Function(_apiError value)? apiError,
    TResult Function(_authError value)? authError,
    TResult Function(_error404 value)? error404,
    TResult Function(_decoderErrorSearch value)? decoderErrorSearch,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _unknown implements DataError {
  const factory _unknown({final Object? error}) = _$unknownImpl;

  Object? get error;
  @JsonKey(ignore: true)
  _$$unknownImplCopyWith<_$unknownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$apiErrorImplCopyWith<$Res> {
  factory _$$apiErrorImplCopyWith(
          _$apiErrorImpl value, $Res Function(_$apiErrorImpl) then) =
      __$$apiErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? reason});
}

/// @nodoc
class __$$apiErrorImplCopyWithImpl<$Res>
    extends _$DataErrorCopyWithImpl<$Res, _$apiErrorImpl>
    implements _$$apiErrorImplCopyWith<$Res> {
  __$$apiErrorImplCopyWithImpl(
      _$apiErrorImpl _value, $Res Function(_$apiErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = freezed,
  }) {
    return _then(_$apiErrorImpl(
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$apiErrorImpl implements _apiError {
  const _$apiErrorImpl({this.reason});

  @override
  final String? reason;

  @override
  String toString() {
    return 'DataError.apiError(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$apiErrorImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$apiErrorImplCopyWith<_$apiErrorImpl> get copyWith =>
      __$$apiErrorImplCopyWithImpl<_$apiErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error) unknown,
    required TResult Function(String? reason) apiError,
    required TResult Function(String? reason) authError,
    required TResult Function() error404,
    required TResult Function(DecoderErrorSearchApiModel? data)
        decoderErrorSearch,
  }) {
    return apiError(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error)? unknown,
    TResult? Function(String? reason)? apiError,
    TResult? Function(String? reason)? authError,
    TResult? Function()? error404,
    TResult? Function(DecoderErrorSearchApiModel? data)? decoderErrorSearch,
  }) {
    return apiError?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? unknown,
    TResult Function(String? reason)? apiError,
    TResult Function(String? reason)? authError,
    TResult Function()? error404,
    TResult Function(DecoderErrorSearchApiModel? data)? decoderErrorSearch,
    required TResult orElse(),
  }) {
    if (apiError != null) {
      return apiError(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_unknown value) unknown,
    required TResult Function(_apiError value) apiError,
    required TResult Function(_authError value) authError,
    required TResult Function(_error404 value) error404,
    required TResult Function(_decoderErrorSearch value) decoderErrorSearch,
  }) {
    return apiError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_unknown value)? unknown,
    TResult? Function(_apiError value)? apiError,
    TResult? Function(_authError value)? authError,
    TResult? Function(_error404 value)? error404,
    TResult? Function(_decoderErrorSearch value)? decoderErrorSearch,
  }) {
    return apiError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_unknown value)? unknown,
    TResult Function(_apiError value)? apiError,
    TResult Function(_authError value)? authError,
    TResult Function(_error404 value)? error404,
    TResult Function(_decoderErrorSearch value)? decoderErrorSearch,
    required TResult orElse(),
  }) {
    if (apiError != null) {
      return apiError(this);
    }
    return orElse();
  }
}

abstract class _apiError implements DataError {
  const factory _apiError({final String? reason}) = _$apiErrorImpl;

  String? get reason;
  @JsonKey(ignore: true)
  _$$apiErrorImplCopyWith<_$apiErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$authErrorImplCopyWith<$Res> {
  factory _$$authErrorImplCopyWith(
          _$authErrorImpl value, $Res Function(_$authErrorImpl) then) =
      __$$authErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? reason});
}

/// @nodoc
class __$$authErrorImplCopyWithImpl<$Res>
    extends _$DataErrorCopyWithImpl<$Res, _$authErrorImpl>
    implements _$$authErrorImplCopyWith<$Res> {
  __$$authErrorImplCopyWithImpl(
      _$authErrorImpl _value, $Res Function(_$authErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = freezed,
  }) {
    return _then(_$authErrorImpl(
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$authErrorImpl implements _authError {
  const _$authErrorImpl({this.reason});

  @override
  final String? reason;

  @override
  String toString() {
    return 'DataError.authError(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$authErrorImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$authErrorImplCopyWith<_$authErrorImpl> get copyWith =>
      __$$authErrorImplCopyWithImpl<_$authErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error) unknown,
    required TResult Function(String? reason) apiError,
    required TResult Function(String? reason) authError,
    required TResult Function() error404,
    required TResult Function(DecoderErrorSearchApiModel? data)
        decoderErrorSearch,
  }) {
    return authError(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error)? unknown,
    TResult? Function(String? reason)? apiError,
    TResult? Function(String? reason)? authError,
    TResult? Function()? error404,
    TResult? Function(DecoderErrorSearchApiModel? data)? decoderErrorSearch,
  }) {
    return authError?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? unknown,
    TResult Function(String? reason)? apiError,
    TResult Function(String? reason)? authError,
    TResult Function()? error404,
    TResult Function(DecoderErrorSearchApiModel? data)? decoderErrorSearch,
    required TResult orElse(),
  }) {
    if (authError != null) {
      return authError(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_unknown value) unknown,
    required TResult Function(_apiError value) apiError,
    required TResult Function(_authError value) authError,
    required TResult Function(_error404 value) error404,
    required TResult Function(_decoderErrorSearch value) decoderErrorSearch,
  }) {
    return authError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_unknown value)? unknown,
    TResult? Function(_apiError value)? apiError,
    TResult? Function(_authError value)? authError,
    TResult? Function(_error404 value)? error404,
    TResult? Function(_decoderErrorSearch value)? decoderErrorSearch,
  }) {
    return authError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_unknown value)? unknown,
    TResult Function(_apiError value)? apiError,
    TResult Function(_authError value)? authError,
    TResult Function(_error404 value)? error404,
    TResult Function(_decoderErrorSearch value)? decoderErrorSearch,
    required TResult orElse(),
  }) {
    if (authError != null) {
      return authError(this);
    }
    return orElse();
  }
}

abstract class _authError implements DataError {
  const factory _authError({final String? reason}) = _$authErrorImpl;

  String? get reason;
  @JsonKey(ignore: true)
  _$$authErrorImplCopyWith<_$authErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$error404ImplCopyWith<$Res> {
  factory _$$error404ImplCopyWith(
          _$error404Impl value, $Res Function(_$error404Impl) then) =
      __$$error404ImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$error404ImplCopyWithImpl<$Res>
    extends _$DataErrorCopyWithImpl<$Res, _$error404Impl>
    implements _$$error404ImplCopyWith<$Res> {
  __$$error404ImplCopyWithImpl(
      _$error404Impl _value, $Res Function(_$error404Impl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$error404Impl implements _error404 {
  const _$error404Impl();

  @override
  String toString() {
    return 'DataError.error404()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$error404Impl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error) unknown,
    required TResult Function(String? reason) apiError,
    required TResult Function(String? reason) authError,
    required TResult Function() error404,
    required TResult Function(DecoderErrorSearchApiModel? data)
        decoderErrorSearch,
  }) {
    return error404();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error)? unknown,
    TResult? Function(String? reason)? apiError,
    TResult? Function(String? reason)? authError,
    TResult? Function()? error404,
    TResult? Function(DecoderErrorSearchApiModel? data)? decoderErrorSearch,
  }) {
    return error404?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? unknown,
    TResult Function(String? reason)? apiError,
    TResult Function(String? reason)? authError,
    TResult Function()? error404,
    TResult Function(DecoderErrorSearchApiModel? data)? decoderErrorSearch,
    required TResult orElse(),
  }) {
    if (error404 != null) {
      return error404();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_unknown value) unknown,
    required TResult Function(_apiError value) apiError,
    required TResult Function(_authError value) authError,
    required TResult Function(_error404 value) error404,
    required TResult Function(_decoderErrorSearch value) decoderErrorSearch,
  }) {
    return error404(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_unknown value)? unknown,
    TResult? Function(_apiError value)? apiError,
    TResult? Function(_authError value)? authError,
    TResult? Function(_error404 value)? error404,
    TResult? Function(_decoderErrorSearch value)? decoderErrorSearch,
  }) {
    return error404?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_unknown value)? unknown,
    TResult Function(_apiError value)? apiError,
    TResult Function(_authError value)? authError,
    TResult Function(_error404 value)? error404,
    TResult Function(_decoderErrorSearch value)? decoderErrorSearch,
    required TResult orElse(),
  }) {
    if (error404 != null) {
      return error404(this);
    }
    return orElse();
  }
}

abstract class _error404 implements DataError {
  const factory _error404() = _$error404Impl;
}

/// @nodoc
abstract class _$$decoderErrorSearchImplCopyWith<$Res> {
  factory _$$decoderErrorSearchImplCopyWith(_$decoderErrorSearchImpl value,
          $Res Function(_$decoderErrorSearchImpl) then) =
      __$$decoderErrorSearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DecoderErrorSearchApiModel? data});
}

/// @nodoc
class __$$decoderErrorSearchImplCopyWithImpl<$Res>
    extends _$DataErrorCopyWithImpl<$Res, _$decoderErrorSearchImpl>
    implements _$$decoderErrorSearchImplCopyWith<$Res> {
  __$$decoderErrorSearchImplCopyWithImpl(_$decoderErrorSearchImpl _value,
      $Res Function(_$decoderErrorSearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$decoderErrorSearchImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DecoderErrorSearchApiModel?,
    ));
  }
}

/// @nodoc

class _$decoderErrorSearchImpl implements _decoderErrorSearch {
  const _$decoderErrorSearchImpl({this.data});

  @override
  final DecoderErrorSearchApiModel? data;

  @override
  String toString() {
    return 'DataError.decoderErrorSearch(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$decoderErrorSearchImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$decoderErrorSearchImplCopyWith<_$decoderErrorSearchImpl> get copyWith =>
      __$$decoderErrorSearchImplCopyWithImpl<_$decoderErrorSearchImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error) unknown,
    required TResult Function(String? reason) apiError,
    required TResult Function(String? reason) authError,
    required TResult Function() error404,
    required TResult Function(DecoderErrorSearchApiModel? data)
        decoderErrorSearch,
  }) {
    return decoderErrorSearch(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error)? unknown,
    TResult? Function(String? reason)? apiError,
    TResult? Function(String? reason)? authError,
    TResult? Function()? error404,
    TResult? Function(DecoderErrorSearchApiModel? data)? decoderErrorSearch,
  }) {
    return decoderErrorSearch?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? unknown,
    TResult Function(String? reason)? apiError,
    TResult Function(String? reason)? authError,
    TResult Function()? error404,
    TResult Function(DecoderErrorSearchApiModel? data)? decoderErrorSearch,
    required TResult orElse(),
  }) {
    if (decoderErrorSearch != null) {
      return decoderErrorSearch(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_unknown value) unknown,
    required TResult Function(_apiError value) apiError,
    required TResult Function(_authError value) authError,
    required TResult Function(_error404 value) error404,
    required TResult Function(_decoderErrorSearch value) decoderErrorSearch,
  }) {
    return decoderErrorSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_unknown value)? unknown,
    TResult? Function(_apiError value)? apiError,
    TResult? Function(_authError value)? authError,
    TResult? Function(_error404 value)? error404,
    TResult? Function(_decoderErrorSearch value)? decoderErrorSearch,
  }) {
    return decoderErrorSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_unknown value)? unknown,
    TResult Function(_apiError value)? apiError,
    TResult Function(_authError value)? authError,
    TResult Function(_error404 value)? error404,
    TResult Function(_decoderErrorSearch value)? decoderErrorSearch,
    required TResult orElse(),
  }) {
    if (decoderErrorSearch != null) {
      return decoderErrorSearch(this);
    }
    return orElse();
  }
}

abstract class _decoderErrorSearch implements DataError {
  const factory _decoderErrorSearch({final DecoderErrorSearchApiModel? data}) =
      _$decoderErrorSearchImpl;

  DecoderErrorSearchApiModel? get data;
  @JsonKey(ignore: true)
  _$$decoderErrorSearchImplCopyWith<_$decoderErrorSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
