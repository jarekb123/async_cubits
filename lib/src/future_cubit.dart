import 'package:async_cubits/async_cubits.dart';
import 'package:meta/meta.dart';

export 'async_value.dart' show AsyncValue;

/// {@template future_cubit}
/// [FutureCubit] loads data from an async source and emits it as [AsyncValue].
///
/// Concrete subclasses define their own load/refresh methods by calling
/// [performLoad] or [performRefresh] with the appropriate future.
///
/// Example — no args:
/// ```dart
/// class UserCubit extends FutureCubit<User> {
///   Future<void> load() => performLoad(repository.getUser);
///   Future<void> refresh() => performRefresh(repository.getUser);
/// }
/// ```
///
/// Example — with args:
/// ```dart
/// class UserCubit extends FutureCubit<User> {
///   Future<void> load(String id) =>
///       performLoad(() => repository.getUser(id));
///   Future<void> refresh(String id) =>
///       performRefresh(() => repository.getUser(id));
/// }
/// ```
/// {@endtemplate}
abstract class FutureCubit<T> extends AsyncCubit<T> {
  /// {@macro future_cubit}
  FutureCubit([super.initialState]);

  /// Loads data from [future] and emits it.
  ///
  /// Emits [AsyncValue.loading] first, then either [AsyncValue.data] or
  /// [AsyncValue.error] depending on the outcome.
  /// Previously loaded data is cleared on each call.
  @protected
  Future<void> performLoad(Future<T> Function() future) async {
    emit(AsyncValue<T>.loading());
    AsyncCubitsLogger.info(debugKey, 'Loading');
    final result = await _load(future);
    emitMergeWithPrevious(_resultToValue(result));
    if (result is _AsyncData<T>) {
      onData(data: result.data, refresh: false);
    }
  }

  /// Refreshes data from [future], merging the loading/error state with the
  /// previous state so that the previous value remains available during reload.
  @protected
  Future<void> performRefresh(Future<T> Function() future) async {
    emitMergeWithPrevious(AsyncValue<T>.loading());
    AsyncCubitsLogger.info(debugKey, 'Refreshing');
    final result = await _load(future);
    emitMergeWithPrevious(_resultToValue(result));
    if (result is _AsyncData<T>) {
      onData(data: result.data, refresh: true);
    }
  }

  /// Called when the async operation returns a value.
  ///
  /// [refresh] is `true` when called from [performRefresh].
  @protected
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

  AsyncValue<T> _resultToValue(_AsyncResult<T> result) {
    return switch (result) {
      final _AsyncData<T> d => AsyncValue.data(d.data),
      final _AsyncError<T> e => AsyncValue.error(e.error, e.stackTrace),
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
