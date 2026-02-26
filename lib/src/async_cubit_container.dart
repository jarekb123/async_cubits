import 'package:async_cubits/async_cubits.dart';

typedef InvalidateFilter<T> = bool Function(T cubit);

/// {@template async_cubit_container}
/// A registry that `AsyncCubit` instances can register into.
///
/// Pass the same [AsyncCubitContainer] to multiple cubits so that one cubit
/// (e.g. a `MutationCubit`) can invalidate another (e.g. a `FutureCubit`)
/// after a successful mutation.
///
/// For simple apps a single shared registry is enough — use [defaultContainer].
/// For more complex scenarios (e.g. feature modules with isolated lifecycles)
/// create separate [AsyncCubitContainer] instances.
///
/// Example:
/// ```dart
/// // Both cubits share the same container (defaultInstance is used automatically).
/// BlocProvider(create: (_) => UserCubit(repository)),
/// BlocProvider(create: (_) => SaveUserCubit(repository)),
///
/// // Inside SaveUserCubit, call invalidate<T>() after a successful mutation:
/// class SaveUserCubit extends MutationCubit<User, void> {
///   SaveUserCubit(this._repository);
///
///   final UserRepository _repository;
///
///   @override
///   Future<void> mutation(User input) => _repository.saveUser(input);
///
///   @override
///   void onSuccess(void result) {
///     super.onSuccess(result);
///     invalidate<UserCubit>();
///   }
/// }
/// ```
/// {@endtemplate}
class AsyncCubitContainer {
  final List<FutureCubit<dynamic>> _cubits = [];

  /// A default shared container instance.
  ///
  /// For simple apps, using this single shared instance is enough.
  static final defaultInstance = AsyncCubitContainer();

  /// Registers [cubit] under its runtime type.
  ///
  /// Called automatically by `AsyncCubit` when constructed with this container.
  void register(FutureCubit<dynamic> cubit) {
    if (!_cubits.contains(cubit)) {
      _cubits.add(cubit);
    }
  }

  /// Removes the registration for [cubit].
  ///
  /// Called automatically by `AsyncCubit.close`.
  void unregister(FutureCubit<dynamic> cubit) {
    _cubits.remove(cubit);
  }

  /// Invalidates all registered cubits of type [T] that match [filter].
  ///
  /// If no cubit of type [T] is registered this is a no-op.
  Future<void> invalidate<T extends FutureCubit<dynamic>>({
    bool reload = false,
    InvalidateFilter<T>? filter,
  }) async {
    await Future.wait(
      _cubits
          .whereType<T>()
          .where((cubit) => filter?.call(cubit) ?? true)
          .map((cubit) => cubit.invalidate(reload: reload)),
    );
  }
}
