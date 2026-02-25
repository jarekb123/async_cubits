import 'package:async_cubits/async_cubits.dart';
import 'package:async_cubits/src/async_cubit_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  ///
  /// [container] and [invalidates] work together: when the mutation succeeds,
  /// every cubit type listed in [invalidates] is looked up in [container] and
  /// invalidated (reset to loading).
  MutationCubit({
    AsyncCubitContainer? container,
  })  : _container = container,
        super(const MutationIdle());

  final AsyncCubitContainer? _container;

  /// Debug key for this cubit. Used for logging purposes.
  @protected
  String get debugKey => runtimeType.toString();

  @override
  void onChange(Change<MutationState<O>> change) {
    super.onChange(change);
    final nextState = change.nextState;
    if (nextState is MutationSuccess<O>) {
      onSuccess(nextState.result);
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

  /// Invalidates the registered [FutureCubit] of type [T] in the container.
  /// Used to refresh data in other cubits after a successful mutation.
  void invalidate<T extends FutureCubit<dynamic>>() {
    _container?.invalidate<T>();
  }
}

/// The state of the [MutationCubit].
sealed class MutationState<T> {
  const MutationState();

  /// The cubit is in the `idle` state, which means
  /// that mutation has not been invoked yet.
  const factory MutationState.idle() = MutationIdle<T>;

  /// {@template mutation_state_loading}
  /// The cubit is in the `loading` state, which means
  /// that the mutation is invoked and is currently in progress.
  /// {@endtemplate}
  const factory MutationState.loading() = MutationLoading<T>;

  /// {@template mutation_state_success}
  /// The cubit is in the `success` state, which means
  /// that the mutation was successful.
  /// {@endtemplate}
  const factory MutationState.success(T result) = MutationSuccess<T>;

  /// {@template mutation_state_failure}
  /// The cubit is in the `failure` state, which means
  /// that the mutation failed.
  /// {@endtemplate}
  const factory MutationState.failure(
    Object error,
    StackTrace stackTrace,
  ) = MutationFailure<T>;

  /// {@macro mutation_state_loading}
  bool get isLoading => this is MutationLoading<T>;

  /// {@macro mutation_state_success}
  bool get isSuccess => this is MutationSuccess<T>;

  /// {@macro mutation_state_failure}
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
final class MutationSuccess<T> extends MutationState<T> {
  /// Creates a [MutationSuccess] state with the given [result].
  const MutationSuccess(this.result);

  /// The result of the successful mutation.
  final T result;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MutationSuccess<T> && other.result == result;

  @override
  int get hashCode => result.hashCode;

  @override
  String toString() => 'MutationState<$T>.success(result: $result)';
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
