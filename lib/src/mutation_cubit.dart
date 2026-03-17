import 'package:async_cubits/async_cubits.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template mutation_cubit}
/// A cubit that handles a asynchronous mutation.
/// The mutation is provided in the [mutation] method. But the mutation is
/// invoked by the [invoke] method.
///
/// Flow:
/// 1. Initially the cubit is in the [MutationIdle] state, which means
/// that mutation has not been called yet.
/// 2. When the [mutation] method is called, the cubit is
/// in the [MutationLoading] state.
/// 3. When the mutation is successful, the cubit is
/// in the [MutationSuccess] state.
/// 4. When the mutation fails, the cubit is in
/// the [MutationFailure] state.
///
/// If the [canRetry] getter returns true and mutation fails, the [invoke]
/// method can be called to retry the mutation.
/// {@endtemplate}
abstract class MutationCubit<I, O> extends Cubit<MutationState<O>> {
  /// {@macro mutation_cubit}
  MutationCubit() : super(const MutationIdle());

  /// Debug key for this cubit. Used for logging purposes.
  @protected
  String get debugKey => runtimeType.toString();

  @override
  void onChange(Change<MutationState<O>> change) {
    super.onChange(change);
    final nextState = change.nextState;
    if (nextState is MutationSuccess<I, O>) {
      onSuccess(nextState.input, nextState.result);
    } else if (nextState is MutationFailure<O>) {
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
      AsyncCubitsLogger.info(
        debugKey,
        'Invoking mutation with input: $input',
      );
    }

    final state = this.state;
    if (state is MutationFailure && !canRetry) {
      AsyncCubitsLogger.info(
        debugKey,
        'Mutation failed and cannot be retried. Ignoring invoke.',
      );
      return;
    }

    emit(MutationLoading<O>());
    try {
      final result = await mutation(input);
      emit(MutationSuccess<I, O>(input, result));
    } catch (e, stackTrace) {
      emit(MutationFailure<O>(e, stackTrace));
    }
  }

  /// Called when the mutation is successful.
  void onSuccess(I input, O result) {
    AsyncCubitsLogger.info(debugKey, 'Mutation successful');
  }
}

/// The state of the [MutationCubit].
sealed class MutationState<T> {
  const MutationState();

  /// Whether the mutation is in progress.
  bool get isLoading => this is MutationLoading<T>;

  /// Whether the mutation completed successfully.
  bool get isSuccess => this is MutationSuccess;

  /// Whether the mutation failed.
  bool get isFailure => this is MutationFailure<T>;
}

/// The cubit is in the `idle` state.
@immutable
final class MutationIdle<T> extends MutationState<T> {
  /// Creates a [MutationIdle] state.
  const MutationIdle();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is MutationIdle<T>;

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => 'MutationState<$T>.idle()';
}

/// The cubit is in the `loading` state.
@immutable
final class MutationLoading<T> extends MutationState<T> {
  /// Creates a [MutationLoading] state.
  const MutationLoading();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is MutationLoading<T>;

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => 'MutationState<$T>.loading()';
}

/// The cubit is in the `success` state.
@immutable
final class MutationSuccess<I, T> extends MutationState<T> {
  /// Creates a [MutationSuccess] state with the given [input] and [result].
  const MutationSuccess(this.input, this.result);

  /// The input that was passed to the mutation.
  final I input;

  /// The result of the successful mutation.
  final T result;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MutationSuccess<I, T> &&
          other.input == input &&
          other.result == result;

  @override
  int get hashCode => Object.hash(input, result);

  @override
  String toString() =>
      'MutationState<$T>.success(input: $input, result: $result)';
}

/// The cubit is in the `failure` state.
@immutable
final class MutationFailure<T> extends MutationState<T> {
  /// Creates a [MutationFailure] state with the given [error] and [stackTrace].
  const MutationFailure(this.error, this.stackTrace);

  /// The error that caused the mutation to fail.
  final Object error;

  /// The stack trace associated with the [error].
  final StackTrace stackTrace;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MutationFailure<T> &&
          other.error == error &&
          other.stackTrace == stackTrace;

  @override
  int get hashCode => Object.hash(error, stackTrace);

  @override
  String toString() =>
      'MutationState<$T>.failure(error: $error, stackTrace: $stackTrace)';
}
