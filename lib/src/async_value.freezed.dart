// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AsyncData<T> {
  T get value;
  bool get isLoading;
  Object? get error;
  StackTrace? get stackTrace;

  /// Create a copy of AsyncData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AsyncDataCopyWith<T, AsyncData<T>> get copyWith =>
      _$AsyncDataCopyWithImpl<T, AsyncData<T>>(
          this as AsyncData<T>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AsyncData<T> &&
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

  @override
  String toString() {
    return 'AsyncData<$T>(value: $value, isLoading: $isLoading, error: $error, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $AsyncDataCopyWith<T, $Res> {
  factory $AsyncDataCopyWith(
          AsyncData<T> value, $Res Function(AsyncData<T>) _then) =
      _$AsyncDataCopyWithImpl;
  @useResult
  $Res call({T value, bool isLoading, Object? error, StackTrace? stackTrace});
}

/// @nodoc
class _$AsyncDataCopyWithImpl<T, $Res> implements $AsyncDataCopyWith<T, $Res> {
  _$AsyncDataCopyWithImpl(this._self, this._then);

  final AsyncData<T> _self;
  final $Res Function(AsyncData<T>) _then;

  /// Create a copy of AsyncData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? isLoading = null,
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_self.copyWith(
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _self.error : error,
      stackTrace: freezed == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _AsyncData<T> extends AsyncData<T> {
  const _AsyncData(this.value,
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

  /// Create a copy of AsyncData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AsyncDataCopyWith<T, _AsyncData<T>> get copyWith =>
      __$AsyncDataCopyWithImpl<T, _AsyncData<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AsyncData<T> &&
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

  @override
  String toString() {
    return 'AsyncData<$T>(value: $value, isLoading: $isLoading, error: $error, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class _$AsyncDataCopyWith<T, $Res>
    implements $AsyncDataCopyWith<T, $Res> {
  factory _$AsyncDataCopyWith(
          _AsyncData<T> value, $Res Function(_AsyncData<T>) _then) =
      __$AsyncDataCopyWithImpl;
  @override
  @useResult
  $Res call({T value, bool isLoading, Object? error, StackTrace? stackTrace});
}

/// @nodoc
class __$AsyncDataCopyWithImpl<T, $Res>
    implements _$AsyncDataCopyWith<T, $Res> {
  __$AsyncDataCopyWithImpl(this._self, this._then);

  final _AsyncData<T> _self;
  final $Res Function(_AsyncData<T>) _then;

  /// Create a copy of AsyncData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = freezed,
    Object? isLoading = null,
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_AsyncData<T>(
      freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _self.error : error,
      stackTrace: freezed == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc
mixin _$AsyncError<T> {
  Object get error;
  StackTrace get stackTrace;
  T? get value;
  bool get hasValue;
  bool get isLoading;

  /// Create a copy of AsyncError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AsyncErrorCopyWith<T, AsyncError<T>> get copyWith =>
      _$AsyncErrorCopyWithImpl<T, AsyncError<T>>(
          this as AsyncError<T>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AsyncError<T> &&
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

  @override
  String toString() {
    return 'AsyncError<$T>(error: $error, stackTrace: $stackTrace, value: $value, hasValue: $hasValue, isLoading: $isLoading)';
  }
}

/// @nodoc
abstract mixin class $AsyncErrorCopyWith<T, $Res> {
  factory $AsyncErrorCopyWith(
          AsyncError<T> value, $Res Function(AsyncError<T>) _then) =
      _$AsyncErrorCopyWithImpl;
  @useResult
  $Res call(
      {Object error,
      StackTrace stackTrace,
      T? value,
      bool hasValue,
      bool isLoading});
}

/// @nodoc
class _$AsyncErrorCopyWithImpl<T, $Res>
    implements $AsyncErrorCopyWith<T, $Res> {
  _$AsyncErrorCopyWithImpl(this._self, this._then);

  final AsyncError<T> _self;
  final $Res Function(AsyncError<T>) _then;

  /// Create a copy of AsyncError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
    Object? value = freezed,
    Object? hasValue = null,
    Object? isLoading = null,
  }) {
    return _then(_self.copyWith(
      error: null == error ? _self.error : error,
      stackTrace: null == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
      hasValue: null == hasValue
          ? _self.hasValue
          : hasValue // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _AsyncError<T> extends AsyncError<T> {
  const _AsyncError(this.error, this.stackTrace,
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

  /// Create a copy of AsyncError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AsyncErrorCopyWith<T, _AsyncError<T>> get copyWith =>
      __$AsyncErrorCopyWithImpl<T, _AsyncError<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AsyncError<T> &&
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

  @override
  String toString() {
    return 'AsyncError<$T>(error: $error, stackTrace: $stackTrace, value: $value, hasValue: $hasValue, isLoading: $isLoading)';
  }
}

/// @nodoc
abstract mixin class _$AsyncErrorCopyWith<T, $Res>
    implements $AsyncErrorCopyWith<T, $Res> {
  factory _$AsyncErrorCopyWith(
          _AsyncError<T> value, $Res Function(_AsyncError<T>) _then) =
      __$AsyncErrorCopyWithImpl;
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
class __$AsyncErrorCopyWithImpl<T, $Res>
    implements _$AsyncErrorCopyWith<T, $Res> {
  __$AsyncErrorCopyWithImpl(this._self, this._then);

  final _AsyncError<T> _self;
  final $Res Function(_AsyncError<T>) _then;

  /// Create a copy of AsyncError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
    Object? value = freezed,
    Object? hasValue = null,
    Object? isLoading = null,
  }) {
    return _then(_AsyncError<T>(
      null == error ? _self.error : error,
      null == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
      hasValue: null == hasValue
          ? _self.hasValue
          : hasValue // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$AsyncLoading<T> {
  T? get value;
  bool get hasValue;

  /// Create a copy of AsyncLoading
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AsyncLoadingCopyWith<T, AsyncLoading<T>> get copyWith =>
      _$AsyncLoadingCopyWithImpl<T, AsyncLoading<T>>(
          this as AsyncLoading<T>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AsyncLoading<T> &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.hasValue, hasValue) ||
                other.hasValue == hasValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(value), hasValue);

  @override
  String toString() {
    return 'AsyncLoading<$T>(value: $value, hasValue: $hasValue)';
  }
}

/// @nodoc
abstract mixin class $AsyncLoadingCopyWith<T, $Res> {
  factory $AsyncLoadingCopyWith(
          AsyncLoading<T> value, $Res Function(AsyncLoading<T>) _then) =
      _$AsyncLoadingCopyWithImpl;
  @useResult
  $Res call({T? value, bool hasValue});
}

/// @nodoc
class _$AsyncLoadingCopyWithImpl<T, $Res>
    implements $AsyncLoadingCopyWith<T, $Res> {
  _$AsyncLoadingCopyWithImpl(this._self, this._then);

  final AsyncLoading<T> _self;
  final $Res Function(AsyncLoading<T>) _then;

  /// Create a copy of AsyncLoading
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? hasValue = null,
  }) {
    return _then(_self.copyWith(
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
      hasValue: null == hasValue
          ? _self.hasValue
          : hasValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _AsyncLoading<T> extends AsyncLoading<T> {
  const _AsyncLoading({this.value, this.hasValue = false}) : super._();

  @override
  final T? value;
  @override
  @JsonKey()
  final bool hasValue;

  /// Create a copy of AsyncLoading
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AsyncLoadingCopyWith<T, _AsyncLoading<T>> get copyWith =>
      __$AsyncLoadingCopyWithImpl<T, _AsyncLoading<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AsyncLoading<T> &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.hasValue, hasValue) ||
                other.hasValue == hasValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(value), hasValue);

  @override
  String toString() {
    return 'AsyncLoading<$T>(value: $value, hasValue: $hasValue)';
  }
}

/// @nodoc
abstract mixin class _$AsyncLoadingCopyWith<T, $Res>
    implements $AsyncLoadingCopyWith<T, $Res> {
  factory _$AsyncLoadingCopyWith(
          _AsyncLoading<T> value, $Res Function(_AsyncLoading<T>) _then) =
      __$AsyncLoadingCopyWithImpl;
  @override
  @useResult
  $Res call({T? value, bool hasValue});
}

/// @nodoc
class __$AsyncLoadingCopyWithImpl<T, $Res>
    implements _$AsyncLoadingCopyWith<T, $Res> {
  __$AsyncLoadingCopyWithImpl(this._self, this._then);

  final _AsyncLoading<T> _self;
  final $Res Function(_AsyncLoading<T>) _then;

  /// Create a copy of AsyncLoading
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = freezed,
    Object? hasValue = null,
  }) {
    return _then(_AsyncLoading<T>(
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
      hasValue: null == hasValue
          ? _self.hasValue
          : hasValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
