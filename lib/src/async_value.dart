import 'package:meta/meta.dart';

/// {@template async_value}
/// [AsyncValue] represents a state of an asynchronous computation.
///
/// It can be in one of 3 states:
/// * [AsyncValue.loading] - when data is being loaded
/// * [AsyncValue.data] - when data is loaded
/// * [AsyncValue.error] - when error occurred while loading data
/// {@endtemplate}
sealed class AsyncValue<T> {
  const AsyncValue();

  /// {@macro async_data}
  const factory AsyncValue.data(T value) = AsyncData<T>;

  /// {@macro async_error}
  const factory AsyncValue.error(
    Object error,
    StackTrace stackTrace,
  ) = AsyncError<T>;

  /// {@macro async_loading}
  const factory AsyncValue.loading() = AsyncLoading<T>;

  /// Whether the value is present
  ///
  /// It can be true even if [isLoading] is true or [hasError] is true
  bool get hasValue;

  /// Whether the new value is fetching asynchronously
  ///
  /// * It can be true even if [hasValue] is true,
  /// e.g. when refreshing (merge [AsyncData] with [AsyncLoading]).
  ///
  /// * It can be true even if [hasError] is true,
  /// e.g. when refreshing (merge [AsyncError] with [AsyncLoading]).
  ///
  /// This typically happens when `FutureCubit.refresh` is called with
  /// previously fetched data.
  bool get isLoading;

  /// Return the value or previous value if in loading/error state.
  /// If there is no previous value, null will be returned during loading/error state.
  T? get value;

  /// Return the error or previous error if in loading state.
  /// If there is no previous error, null will be returned during loading state.
  Object? get error;

  /// Return the error's stackTrace or previous stackTrace if in loading state.
  /// If there is no previous stackTrace, null will be returned during
  /// loading state.
  StackTrace? get stackTrace;

  /// Clone an [AsyncValue], merging it with [previous].
  ///
  /// When doing so, the resulting [AsyncValue] can contain the information
  /// about multiple states at once.
  /// For example, this allows an [AsyncError] to contain a [value], or even
  /// [AsyncLoading] to contain both a [value] and an [error].
  AsyncValue<T> mergeWithPrevious(AsyncValue<T> previous);

  /// Perform some action based on the current state of the [AsyncValue].
  ///
  /// This allows reading the content of an [AsyncValue] in a type-safe way,
  /// without potentially ignoring to handle a case.
  R map<R>({
    required R Function(AsyncData<T> data) data,
    required R Function(AsyncError<T> error) error,
    required R Function(AsyncLoading<T> loading) loading,
  });

  /// Perform some action based on the current state of the [AsyncValue].
  ///
  /// Works just like map, with an exception that none of the functions
  /// is required.
  R? mapOrNull<R>({
    R? Function(AsyncData<T> data)? data,
    R? Function(AsyncError<T> error)? error,
    R? Function(AsyncLoading<T> loading)? loading,
  });
}

/// {@template async_data}
/// A state representing that asynchronous computation
/// has succeeded with a value
/// {@endtemplate}
@immutable
final class AsyncData<T> extends AsyncValue<T> {
  /// {@macro async_data}
  const AsyncData(
    this.value, {
    this.isLoading = false,
    this.error,
    this.stackTrace,
  });

  @override
  final T value;

  @override
  final bool isLoading;

  @override
  final Object? error;

  @override
  final StackTrace? stackTrace;

  @override
  bool get hasValue => true;

  @override
  AsyncValue<T> mergeWithPrevious(AsyncValue<T> previous) => this;

  @override
  R map<R>({
    required R Function(AsyncData<T> data) data,
    required R Function(AsyncError<T> error) error,
    required R Function(AsyncLoading<T> loading) loading,
  }) =>
      data(this);

  @override
  R? mapOrNull<R>({
    R? Function(AsyncData<T> data)? data,
    R? Function(AsyncError<T> error)? error,
    R? Function(AsyncLoading<T> loading)? loading,
  }) =>
      data?.call(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AsyncData<T> &&
          other.value == value &&
          other.isLoading == isLoading &&
          other.error == error &&
          other.stackTrace == stackTrace;

  @override
  int get hashCode => Object.hash(value, isLoading, error, stackTrace);

  @override
  String toString() => 'AsyncData<$T>('
      'value: $value, '
      'isLoading: $isLoading, '
      'error: $error, '
      'stackTrace: $stackTrace)';
}

/// {@template async_error}
/// A state representing that asynchronous computation has failed with an error
/// {@endtemplate}
@immutable
final class AsyncError<T> extends AsyncValue<T> {
  /// {@macro async_error}
  const AsyncError(
    this.error,
    this.stackTrace, {
    this.value,
    this.hasValue = false,
    this.isLoading = false,
  });

  @override
  final Object error;

  @override
  final StackTrace stackTrace;

  @override
  final T? value;

  @override
  final bool hasValue;

  @override
  final bool isLoading;

  @override
  AsyncValue<T> mergeWithPrevious(AsyncValue<T> previous) => AsyncError(
        error,
        stackTrace,
        hasValue: previous.hasValue,
        value: previous.value,
        isLoading: isLoading,
      );

  @override
  R map<R>({
    required R Function(AsyncData<T> data) data,
    required R Function(AsyncError<T> error) error,
    required R Function(AsyncLoading<T> loading) loading,
  }) =>
      error(this);

  @override
  R? mapOrNull<R>({
    R? Function(AsyncData<T> data)? data,
    R? Function(AsyncError<T> error)? error,
    R? Function(AsyncLoading<T> loading)? loading,
  }) =>
      error?.call(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AsyncError<T> &&
          other.error == error &&
          other.stackTrace == stackTrace &&
          other.value == value &&
          other.hasValue == hasValue &&
          other.isLoading == isLoading;

  @override
  int get hashCode =>
      Object.hash(error, stackTrace, value, hasValue, isLoading);

  @override
  String toString() => 'AsyncError<$T>('
      'error: $error, '
      'stackTrace: $stackTrace, '
      'value: $value, '
      'hasValue: $hasValue, '
      'isLoading: $isLoading)';
}

/// {@template async_loading}
/// A state representing that the value is being fetched asynchronously
/// (e.g. from a network call).
/// {@endtemplate}
@immutable
final class AsyncLoading<T> extends AsyncValue<T> {
  /// {@macro async_loading}
  const AsyncLoading({
    this.value,
    this.hasValue = false,
  });

  @override
  final T? value;

  @override
  final bool hasValue;

  @override
  bool get isLoading => true;

  @override
  Object? get error => null;

  @override
  StackTrace? get stackTrace => null;

  @override
  AsyncValue<T> mergeWithPrevious(AsyncValue<T> previous) {
    return previous.map(
      data: (d) => AsyncData(
        d.value,
        isLoading: isLoading,
        error: d.error,
        stackTrace: d.stackTrace,
      ),
      error: (e) => AsyncError(
        e.error,
        e.stackTrace,
        value: value,
        hasValue: hasValue,
        isLoading: isLoading,
      ),
      loading: (_) => this,
    );
  }

  @override
  R map<R>({
    required R Function(AsyncData<T> data) data,
    required R Function(AsyncError<T> error) error,
    required R Function(AsyncLoading<T> loading) loading,
  }) =>
      loading(this);

  @override
  R? mapOrNull<R>({
    R? Function(AsyncData<T> data)? data,
    R? Function(AsyncError<T> error)? error,
    R? Function(AsyncLoading<T> loading)? loading,
  }) =>
      loading?.call(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AsyncLoading<T> &&
          other.value == value &&
          other.hasValue == hasValue;

  @override
  int get hashCode => Object.hash(value, hasValue);

  @override
  String toString() => 'AsyncLoading<$T>(value: $value, hasValue: $hasValue)';
}

/// Extension on [AsyncValue] providing utility methods
extension AsyncValueExtension<T> on AsyncValue<T> {
  /// Whether the current fetching has failed
  ///
  /// It can be true even if [isLoading] is true
  bool get hasError => error != null;

  /// {@template asyncvalue.when}
  /// Perform some action based on the current state of the [AsyncValue].
  /// This allows reading the content of an [AsyncValue] in a type-safe way,
  /// without potentially ignoring to handle a case.
  ///
  /// * [skipLoadingOnRefresh] (default: true) is used to skip the loading
  /// state when the previous value is available
  ///
  /// * [skipError] (default: false) is used to skip the error state when
  /// the previous data is available
  /// {@endtemplate}
  R when<R>({
    required R Function(T value) data,
    required R Function(Object error, StackTrace stackTrace) error,
    required R Function() loading,
    bool skipError = false,
    bool skipLoadingOnRefresh = true,
  }) {
    if (isLoading) {
      if (skipLoadingOnRefresh && hasValue) {
        return data(value as T);
      } else {
        return loading();
      }
    } else if (hasError) {
      if (hasValue && skipError) {
        return data(value as T);
      } else {
        return error(this.error!, stackTrace!);
      }
    } else {
      return data(value as T);
    }
  }

  /// Returns [orElse] when some case is not handled
  ///
  /// {@macro asyncvalue.when}
  R maybeWhen<R>({
    required R Function() orElse,
    bool skipLoadingOnRefresh = true,
    bool skipError = false,
    R Function(T value)? data,
    R Function(Object error, StackTrace stackTrace)? error,
    R Function()? loading,
  }) {
    return when(
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      skipError: skipError,
      data: data ?? (_) => orElse(),
      error: error ?? (_, __) => orElse(),
      loading: loading ?? () => orElse(),
    );
  }

  /// Map the value if it is present (value is in [AsyncData] state).
  /// Otherwise returns loading/error state.
  AsyncValue<R> whenSuccess<R>(R Function(T value) mapper) {
    return map(
      data: (data) => AsyncData(mapper(data.value)),
      error: (error) => AsyncError(error.error, error.stackTrace),
      loading: (loading) => const AsyncLoading(),
    );
  }
}

/// Extension on [Future<AsyncValue>] providing utility methods
extension FutureAsyncValueExtension<T> on Future<AsyncValue<T>> {
  /// Async version of [AsyncValueExtension.whenSuccess]
  Future<AsyncValue<R>> whenSuccess<R>(R Function(T value) mapper) {
    return then((value) => value.whenSuccess(mapper));
  }
}
