import 'dart:async';

import 'package:async_cubits/async_cubits.dart';
import 'package:meta/meta.dart';

/// {@template stream_cubit}
/// [StreamCubit] loads data from [dataStream] and emits it in safe way.
/// The result of [dataStream] is wrapped in [AsyncValue].
/// {@endtemplate}
abstract class StreamCubit<T> extends AsyncCubit<T> {
  /// Creates [StreamCubit].
  /// If `initialState` is not provided, [AsyncValue.loading]
  /// as initial state will be used.
  ///
  /// {@macro stream_cubit}
  StreamCubit({super.initialState});

  StreamSubscription<T>? _subscription;

  /// Stream that emits data.
  @protected
  Stream<T> dataStream();

  /// Returns `true` if [dataStream] is subscribed.
  bool get subscribed => _subscription != null;

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  /// Subscribes to [dataStream] and emits data.
  ///
  /// If you call [subscribe] again, it will cancel previous subscription
  /// (this may cause some side effects, eg. fetching data from API again).
  void subscribe() {
    emit(AsyncValue<T>.loading());
    AsyncCubitsLogger.info(debugKey, 'Subscribing to stream');

    _subscription?.cancel();
    _subscription ??= dataStream().listen(
      (data) {
        AsyncCubitsLogger.info(debugKey, 'Received data from stream');
        emitMergeWithPrevious(AsyncValue<T>.data(data));
      },
      onError: (Object error, StackTrace stackTrace) {
        AsyncCubitsLogger.error(
          debugKey,
          'Error occurred while listening to stream',
          error,
          stackTrace,
        );
        emitMergeWithPrevious(AsyncValue<T>.error(error, stackTrace));
      },
    );
  }

  /// Re-subscribes to [dataStream] again.
  ///
  /// If you call [refresh] when [StreamCubit] has already loaded data, it will
  /// not clear previously loaded data and will not emit [AsyncValue.loading]
  /// (but it will merge current state with loading state).
  Future<void> refresh() async {
    AsyncCubitsLogger.info(debugKey, 'Refreshing');
    emitMergeWithPrevious(AsyncValue<T>.loading());
    subscribe();
    await stream.first;
  }
}
