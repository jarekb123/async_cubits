import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_value.freezed.dart';

/// {@template async_value}
/// [AsyncValue] represents a state of an asynchronous computation.
///
/// It can be in one of 3 states:
/// * [AsyncValue.loading] - when data is being loaded
/// * [AsyncValue.data] - when data is loaded
/// * [AsyncValue.error] - when error occurred while loading data
/// {@endtemplate}
abstract class AsyncValue<T> {
  /// {@macro async_data}
  const factory AsyncValue.data(T value) = AsyncData<T>;

  /// {@macro async_error}
  const factory AsyncValue.error(
    Object error,
    StackTrace stackTrace,
  ) = AsyncError<T>;

  /// {@macro async_loading}
  const factory AsyncValue.loading() = AsyncLoading<T>;

  /// Wheter the value is present
  ///
  /// It can be true even if [isLoading] is true or [hasError] is true
  bool get hasValue;

  /// Wheter the new value is fetching asynchronously
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
@freezed
abstract class AsyncData<T> with _$AsyncData<T> implements AsyncValue<T> {
  /// {@macro async_data}
  const factory AsyncData(
    T value, {
    @Default(false) bool isLoading,
    Object? error,
    StackTrace? stackTrace,
  }) = _AsyncData<T>;

  const AsyncData._();

  @override
  bool get hasValue => true;

  @override
  bool get isLoading => false;

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
}

/// {@template async_error}
/// A state representing that asynchronous computation has failed with an error
/// {@endtemplate}
@freezed
abstract class AsyncError<T> with _$AsyncError<T> implements AsyncValue<T> {
  /// {@macro async_error}
  const factory AsyncError(
    Object error,
    StackTrace stackTrace, {
    T? value,
    @Default(false) bool hasValue,
    @Default(false) bool isLoading,
  }) = _AsyncError<T>;

  const AsyncError._();

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
}

/// {@template async_loading}
/// A state representing that the value is being fetched asynchronously
/// (e.g. from a network call).
/// {@endtemplate}
@freezed
abstract class AsyncLoading<T> with _$AsyncLoading<T> implements AsyncValue<T> {
  /// {@macro async_loading}
  const factory AsyncLoading({
    T? value,
    @Default(false) bool hasValue,
  }) = _AsyncLoading<T>;

  const AsyncLoading._();

  @override
  bool get isLoading => true;

  @override
  Object? get error => null;

  @override
  StackTrace? get stackTrace => null;

  @override
  AsyncValue<T> mergeWithPrevious(
    AsyncValue<T> previous, {
    bool isRefresh = true,
  }) {
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
