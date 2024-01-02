import 'package:async_cubits/async_cubits.dart';
import 'package:async_cubits/src/future_cubit_performer.dart';
import 'package:meta/meta.dart';

export 'async_value.dart' show AsyncValue;

/// {@template future_cubit}
/// [FutureCubit] loads data from [future] and emits it in safe way.
/// The result of [future] is wrapped in [AsyncValue].
/// {@endtemplate}
abstract class FutureCubit<T> extends AsyncCubit<T>
    with FutureCubitPerformerMixin<T> {
  /// Creates [FutureCubit].
  /// If `initialState` is not provided, [AsyncValue.loading]
  /// as initial state will be used.
  ///
  /// {@macro async_cubit}
  FutureCubit([super.initialState]);

  /// Performs the actual async operation.
  /// It is used by [load] and [refresh] internally.
  @protected
  Future<T> future();

  /// Loads data from [future] and emits it.
  /// If you call [load] when [FutureCubit] has already loaded data, it will
  /// clear previously loaded data.
  ///
  /// If [future] returns a value, it will be emitted as [AsyncValue.data].
  /// If [future] throws an error, it will be emitted as [AsyncValue.error].
  Future<void> load() => performLoad(future);

  /// Refreshes data from [future] and merges loading/error state with previous state.
  ///
  /// If previous state was:
  /// * [AsyncValue.data] -> new will have [AsyncValue.isLoading] set to true
  /// and value from previous state.
  /// * [AsyncValue.error] -> new will have [AsyncValue.isLoading] set to true
  /// and error/stackTrace from previous state.
  /// * [AsyncValue.loading] -> new will be [AsyncLoading].
  Future<void> refresh() => performRefresh(future);
}
