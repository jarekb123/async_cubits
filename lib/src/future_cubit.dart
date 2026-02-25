import 'package:async_cubits/async_cubits.dart';
import 'package:async_cubits/src/future_cubit_performer.dart';

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
abstract class FutureCubit<T> extends AsyncCubit<T>
    with FutureCubitPerformerMixin<T> {
  /// {@macro future_cubit}
  FutureCubit([super.initialState]);
}
