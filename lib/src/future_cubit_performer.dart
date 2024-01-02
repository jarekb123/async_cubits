import 'package:async_cubits/async_cubits.dart';
import 'package:meta/meta.dart';

/// Provides utility methods for [FutureCubit] and [FutureWithArgsCubit].
mixin FutureCubitPerformerMixin<T> on AsyncCubit<T> {
  /// Loads data from [future] and emits it.
  @protected
  Future<void> performLoad(
    Future<T> Function() future,
  ) async {
    emit(AsyncValue<T>.loading());
    AsyncCubitsLogger.info(debugKey, 'Loading');
    final result = await _load(future);
    emitMergeWithPrevious(_mapResultToValue(result));

    if (result is _AsyncData<T>) {
      onData(data: result.data, refresh: false);
    }
  }

  /// Refreshes FutureCubit data using [future].
  @protected
  Future<void> performRefresh(
    Future<T> Function() future,
  ) async {
    emitMergeWithPrevious(AsyncValue<T>.loading());
    AsyncCubitsLogger.info(debugKey, 'Refreshing');
    final result = await _load(future);
    emitMergeWithPrevious(_mapResultToValue(result));

    if (result is _AsyncData<T>) {
      onData(data: result.data, refresh: true);
    }
  }

  /// Override this method to make some side effects
  /// when async operation returns a value.
  ///
  /// [refresh] is true when async operation
  /// was called by [refresh] method.
  void onData({required T data, required bool refresh}) {}

  Future<_AsyncResult<T>> _load(Future<T> Function() future) async {
    try {
      final value = await future();
      AsyncCubitsLogger.info(debugKey, 'Successfully loaded');
      return _AsyncData(value);
    } catch (error, stackTrace) {
      AsyncCubitsLogger.error(
        debugKey,
        'Error while loading data',
        error,
        stackTrace,
      );
      return _AsyncError<T>(error, stackTrace);
    }
  }

  AsyncValue<T> _mapResultToValue(_AsyncResult<T> result) {
    return switch (result) {
      final _AsyncData<T> data => AsyncValue.data(data.data),
      final _AsyncError<T> error =>
        AsyncValue.error(error.error, error.stackTrace),
    };
  }
}

sealed class _AsyncResult<T> {}

class _AsyncData<T> extends _AsyncResult<T> {
  _AsyncData(this.data);

  final T data;
}

class _AsyncError<T> extends _AsyncResult<T> {
  _AsyncError(this.error, this.stackTrace);

  final Object error;
  final StackTrace stackTrace;
}
