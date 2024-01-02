// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AsyncData<T> {
  T get value => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AsyncDataCopyWith<T, AsyncData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AsyncDataCopyWith<T, $Res> {
  factory $AsyncDataCopyWith(
          AsyncData<T> value, $Res Function(AsyncData<T>) then) =
      _$AsyncDataCopyWithImpl<T, $Res, AsyncData<T>>;
  @useResult
  $Res call({T value, bool isLoading, Object? error, StackTrace? stackTrace});
}

/// @nodoc
class _$AsyncDataCopyWithImpl<T, $Res, $Val extends AsyncData<T>>
    implements $AsyncDataCopyWith<T, $Res> {
  _$AsyncDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? isLoading = null,
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AsyncDataCopyWith<T, $Res>
    implements $AsyncDataCopyWith<T, $Res> {
  factory _$$_AsyncDataCopyWith(
          _$_AsyncData<T> value, $Res Function(_$_AsyncData<T>) then) =
      __$$_AsyncDataCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T value, bool isLoading, Object? error, StackTrace? stackTrace});
}

/// @nodoc
class __$$_AsyncDataCopyWithImpl<T, $Res>
    extends _$AsyncDataCopyWithImpl<T, $Res, _$_AsyncData<T>>
    implements _$$_AsyncDataCopyWith<T, $Res> {
  __$$_AsyncDataCopyWithImpl(
      _$_AsyncData<T> _value, $Res Function(_$_AsyncData<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? isLoading = null,
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$_AsyncData<T>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$_AsyncData<T> extends _AsyncData<T> {
  const _$_AsyncData(this.value,
      {this.isLoading = false, this.error, this.stackTrace})
      : super._();

  @override
  final T value;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Object? error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'AsyncData<$T>(value: $value, isLoading: $isLoading, error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AsyncData<T> &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(value),
      isLoading,
      const DeepCollectionEquality().hash(error),
      stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AsyncDataCopyWith<T, _$_AsyncData<T>> get copyWith =>
      __$$_AsyncDataCopyWithImpl<T, _$_AsyncData<T>>(this, _$identity);
}

abstract class _AsyncData<T> extends AsyncData<T> {
  const factory _AsyncData(final T value,
      {final bool isLoading,
      final Object? error,
      final StackTrace? stackTrace}) = _$_AsyncData<T>;
  const _AsyncData._() : super._();

  @override
  T get value;
  @override
  bool get isLoading;
  @override
  Object? get error;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$_AsyncDataCopyWith<T, _$_AsyncData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AsyncError<T> {
  Object get error => throw _privateConstructorUsedError;
  StackTrace get stackTrace => throw _privateConstructorUsedError;
  T? get value => throw _privateConstructorUsedError;
  bool get hasValue => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AsyncErrorCopyWith<T, AsyncError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AsyncErrorCopyWith<T, $Res> {
  factory $AsyncErrorCopyWith(
          AsyncError<T> value, $Res Function(AsyncError<T>) then) =
      _$AsyncErrorCopyWithImpl<T, $Res, AsyncError<T>>;
  @useResult
  $Res call(
      {Object error,
      StackTrace stackTrace,
      T? value,
      bool hasValue,
      bool isLoading});
}

/// @nodoc
class _$AsyncErrorCopyWithImpl<T, $Res, $Val extends AsyncError<T>>
    implements $AsyncErrorCopyWith<T, $Res> {
  _$AsyncErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
    Object? value = freezed,
    Object? hasValue = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      error: null == error ? _value.error : error,
      stackTrace: null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
      hasValue: null == hasValue
          ? _value.hasValue
          : hasValue // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AsyncErrorCopyWith<T, $Res>
    implements $AsyncErrorCopyWith<T, $Res> {
  factory _$$_AsyncErrorCopyWith(
          _$_AsyncError<T> value, $Res Function(_$_AsyncError<T>) then) =
      __$$_AsyncErrorCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {Object error,
      StackTrace stackTrace,
      T? value,
      bool hasValue,
      bool isLoading});
}

/// @nodoc
class __$$_AsyncErrorCopyWithImpl<T, $Res>
    extends _$AsyncErrorCopyWithImpl<T, $Res, _$_AsyncError<T>>
    implements _$$_AsyncErrorCopyWith<T, $Res> {
  __$$_AsyncErrorCopyWithImpl(
      _$_AsyncError<T> _value, $Res Function(_$_AsyncError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
    Object? value = freezed,
    Object? hasValue = null,
    Object? isLoading = null,
  }) {
    return _then(_$_AsyncError<T>(
      null == error ? _value.error : error,
      null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
      hasValue: null == hasValue
          ? _value.hasValue
          : hasValue // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AsyncError<T> extends _AsyncError<T> {
  const _$_AsyncError(this.error, this.stackTrace,
      {this.value, this.hasValue = false, this.isLoading = false})
      : super._();

  @override
  final Object error;
  @override
  final StackTrace stackTrace;
  @override
  final T? value;
  @override
  @JsonKey()
  final bool hasValue;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AsyncError<$T>(error: $error, stackTrace: $stackTrace, value: $value, hasValue: $hasValue, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AsyncError<T> &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.hasValue, hasValue) ||
                other.hasValue == hasValue) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      stackTrace,
      const DeepCollectionEquality().hash(value),
      hasValue,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AsyncErrorCopyWith<T, _$_AsyncError<T>> get copyWith =>
      __$$_AsyncErrorCopyWithImpl<T, _$_AsyncError<T>>(this, _$identity);
}

abstract class _AsyncError<T> extends AsyncError<T> {
  const factory _AsyncError(final Object error, final StackTrace stackTrace,
      {final T? value,
      final bool hasValue,
      final bool isLoading}) = _$_AsyncError<T>;
  const _AsyncError._() : super._();

  @override
  Object get error;
  @override
  StackTrace get stackTrace;
  @override
  T? get value;
  @override
  bool get hasValue;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_AsyncErrorCopyWith<T, _$_AsyncError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AsyncLoading<T> {
  T? get value => throw _privateConstructorUsedError;
  bool get hasValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AsyncLoadingCopyWith<T, AsyncLoading<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AsyncLoadingCopyWith<T, $Res> {
  factory $AsyncLoadingCopyWith(
          AsyncLoading<T> value, $Res Function(AsyncLoading<T>) then) =
      _$AsyncLoadingCopyWithImpl<T, $Res, AsyncLoading<T>>;
  @useResult
  $Res call({T? value, bool hasValue});
}

/// @nodoc
class _$AsyncLoadingCopyWithImpl<T, $Res, $Val extends AsyncLoading<T>>
    implements $AsyncLoadingCopyWith<T, $Res> {
  _$AsyncLoadingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? hasValue = null,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
      hasValue: null == hasValue
          ? _value.hasValue
          : hasValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AsyncLoadingCopyWith<T, $Res>
    implements $AsyncLoadingCopyWith<T, $Res> {
  factory _$$_AsyncLoadingCopyWith(
          _$_AsyncLoading<T> value, $Res Function(_$_AsyncLoading<T>) then) =
      __$$_AsyncLoadingCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T? value, bool hasValue});
}

/// @nodoc
class __$$_AsyncLoadingCopyWithImpl<T, $Res>
    extends _$AsyncLoadingCopyWithImpl<T, $Res, _$_AsyncLoading<T>>
    implements _$$_AsyncLoadingCopyWith<T, $Res> {
  __$$_AsyncLoadingCopyWithImpl(
      _$_AsyncLoading<T> _value, $Res Function(_$_AsyncLoading<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? hasValue = null,
  }) {
    return _then(_$_AsyncLoading<T>(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
      hasValue: null == hasValue
          ? _value.hasValue
          : hasValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AsyncLoading<T> extends _AsyncLoading<T> {
  const _$_AsyncLoading({this.value, this.hasValue = false}) : super._();

  @override
  final T? value;
  @override
  @JsonKey()
  final bool hasValue;

  @override
  String toString() {
    return 'AsyncLoading<$T>(value: $value, hasValue: $hasValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AsyncLoading<T> &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.hasValue, hasValue) ||
                other.hasValue == hasValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(value), hasValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AsyncLoadingCopyWith<T, _$_AsyncLoading<T>> get copyWith =>
      __$$_AsyncLoadingCopyWithImpl<T, _$_AsyncLoading<T>>(this, _$identity);
}

abstract class _AsyncLoading<T> extends AsyncLoading<T> {
  const factory _AsyncLoading({final T? value, final bool hasValue}) =
      _$_AsyncLoading<T>;
  const _AsyncLoading._() : super._();

  @override
  T? get value;
  @override
  bool get hasValue;
  @override
  @JsonKey(ignore: true)
  _$$_AsyncLoadingCopyWith<T, _$_AsyncLoading<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
