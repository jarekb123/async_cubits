import 'package:async_cubits/async_cubits.dart';

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
/// // Both cubits share the same container.
/// BlocProvider(create: (_) => UserCubit(container: defaultContainer)),
/// BlocProvider(create: (_) => SaveUserCubit(container: defaultContainer)),
///
/// // Inside SaveUserCubit:
/// class SaveUserCubit extends MutationCubit<User, void> {
///   SaveUserCubit()
///       : super(container: defaultContainer, invalidates: [UserCubit]);
///   ...
/// }
/// ```
/// {@endtemplate}
class AsyncCubitContainer {
  final Map<Type, FutureCubit<dynamic>> _cubits = {};

  /// A default shared container instance.
  ///
  /// For simple apps, using this single shared instance is enough.
  static final defaultInstance = AsyncCubitContainer();

  /// Registers [cubit] under its runtime type.
  ///
  /// Called automatically by `AsyncCubit` when constructed with this container.
  void register(FutureCubit<dynamic> cubit) {
    _cubits[cubit.runtimeType] = cubit;
  }

  /// Removes the registration for [cubit].
  ///
  /// Called automatically by `AsyncCubit.close`.
  void unregister(FutureCubit<dynamic> cubit) {
    _cubits.remove(cubit.runtimeType);
  }

  /// Returns the registered cubit of type [T], or `null` if not registered.
  T? get<T extends FutureCubit<dynamic>>() => _cubits[T] as T?;

  /// Invalidates the registered cubit of type [T].
  ///
  /// If no cubit of type [T] is registered this is a no-op.
  Future<void> invalidate<T extends FutureCubit<dynamic>>() async =>
      get<T>()?.invalidate();

  /// Invalidates all registered cubits whose runtime type is in [types].
  Future<void> invalidateAll(List<Type> types) async {
    await Future.wait([
      for (final type in types)
        if (_cubits[type] case final cubit?) cubit.invalidate(),
    ]);
  }
}
