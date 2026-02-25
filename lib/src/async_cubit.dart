import 'package:async_cubits/async_cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

/// {@template async_cubit}
/// [AsyncCubit] is a cubit that loads data from some async source
/// (eg. network, database).
///
/// It emits [AsyncValue] which can be in one of 3 states:
/// * [AsyncValue.loading] - when data is being loaded
/// * [AsyncValue.data] - when data is loaded
/// * [AsyncValue.error] - when error occurred while loading data
///
/// It is a base class for [FutureCubit] and [StreamCubit].
/// {@endtemplate}
abstract class AsyncCubit<T> extends Cubit<AsyncValue<T>> {
  /// {@macro async_cubit}
  AsyncCubit({AsyncValue<T>? initialState})
      : super(initialState ?? AsyncValue<T>.loading());

  /// Debug key for this cubit. Used for logging purposes.
  String get debugKey => runtimeType.toString();

  @override
  void emit(AsyncValue<T> state) {
    // override emit to prevent emitting new state when cubit is closed
    // eg. when loading data from network and user leaves the screen
    if (!isClosed) {
      super.emit(state);
    }
  }

  /// Merge current state with the new one.
  @protected
  void emitMergeWithPrevious(AsyncValue<T> value) {
    emit(value.mergeWithPrevious(state));
  }

  /// Updates the [AsyncCubit] with the provided data.
  /// This method can be used to emit new data from the [AsyncCubit] without
  /// making call using load/refresh methods.
  void updateData(T data) => emitMergeWithPrevious(AsyncValue.data(data));
}
