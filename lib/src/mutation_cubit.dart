import 'package:async_cubits/async_cubits.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mutation_cubit.freezed.dart';

/// {@template mutation_cubit}
/// A cubit that handles a asynchronous mutation.
/// The mutation is provided in the [mutation] method. But the mutation is
/// invoked by the [invoke] method.
///
/// Flow:
/// 1. Initially the cubit is in the [MutationState.idle] state, which means
/// that mutation has not been called yet.
/// 2. When the [mutation] method is called, the cubit is
/// in the [MutationState.loading] state.
/// 3. When the mutation is successful, the cubit is
/// in the [MutationState.success] state.
/// 4. When the mutation fails, the cubit is in
/// the [MutationState.failure] state.
///
/// If the [canRetry] getter returns true and mutation fails, the [invoke]
/// method can be called to retry the mutation.
/// {@endtemplate}
abstract class MutationCubit<I, O> extends Cubit<MutationState<O>> {
  /// {@macro mutation_cubit}
  MutationCubit() : super(const MutationState.idle());

  /// Debug key for this cubit. Used for logging purposes.
  @protected
  String get debugKey => runtimeType.toString();

  @override
  void onChange(Change<MutationState<O>> change) {
    super.onChange(change);
    final nextState = change.nextState;
    if (nextState is _Success<O>) {
      onSuccess(nextState.result);
    } else if (nextState is _Failure<O>) {
      AsyncCubitsLogger.error(
        debugKey,
        'Mutation failed',
        nextState.error,
        nextState.stackTrace,
      );
    }
  }

  /// The mutation that is invoked by the [invoke] method.
  Future<O> mutation(I input);

  /// Whether the mutation can be retried.
  bool get canRetry => true;

  /// Invokes the mutation.
  ///
  /// If [canRetry] and mutation fails, the [invoke] method
  /// can be called to retry the mutation.
  Future<void> invoke(I input) async {
    if (kReleaseMode) {
      AsyncCubitsLogger.info(debugKey, 'Invoking mutation');
    } else {
      AsyncCubitsLogger.info(debugKey, 'Invoking mutation with input: $input');
    }

    final state = this.state;
    if (state is _Failure && !canRetry) {
      AsyncCubitsLogger.info(
        debugKey,
        'Mutation failed and cannot be retried. Ignoring invoke.',
      );
      return;
    }

    emit(MutationState<O>.loading());
    try {
      final result = await mutation(input);
      emit(MutationState<O>.success(result));
    } catch (e, stackTrace) {
      emit(MutationState<O>.failure(e, stackTrace));
    }
  }

  /// Called when the mutation is successful.
  void onSuccess(O result) {
    AsyncCubitsLogger.info(debugKey, 'Mutation successful');
  }
}

/// The state of the [MutationCubit].
@freezed
sealed class MutationState<T> with _$MutationState<T> {
  /// The cubit is in the `idle` state, which means
  /// that mutation has not been invoked yet.
  const factory MutationState.idle() = _Idle<T>;

  /// {@template mutation_state_loading}
  /// The cubit is in the `loading` state, which means
  /// that the mutation is invoked and is currently in progress.
  /// {@endtemplate}
  const factory MutationState.loading() = _Loading<T>;

  /// {@template mutation_state_success}
  /// The cubit is in the `success` state, which means
  /// that the mutation was successful.
  /// {@endtemplate}
  const factory MutationState.success(T result) = _Success<T>;

  /// {@template mutation_state_failure}
  /// The cubit is in the `failure` state, which means
  /// that the mutation failed.
  /// {@endtemplate}
  const factory MutationState.failure(Object error, StackTrace stackTrace) =
      _Failure<T>;

  const MutationState._();

  /// {@macro mutation_state_loading}
  bool get isLoading => this is _Loading<T>;

  /// {@macro mutation_state_success}
  bool get isSuccess => this is _Success<T>;

  /// {@macro mutation_state_failure}
  bool get isFailure => this is _Failure<T>;
}
