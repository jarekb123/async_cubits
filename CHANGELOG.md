# 0.5.1

- Added `AsyncCubitContainer.performDefault<T>()` static shorthand for `AsyncCubitContainer.defaultInstance.perform<T>()`

# 0.5.0

- **Breaking**: `AsyncCubitContainer.invalidate<T>()` replaced by `perform<T>({required runner, filter})` — accepts any `BlocBase` subtype and executes an arbitrary async `runner` on each matching cubit
- **Breaking**: `MutationCubit.invalidate<T>()` removed — use `container.perform<T>(runner: (c) => c.invalidate())` inside `onSuccess` instead
- `FutureCubit.invalidate` gains `optimisticRefresh` parameter: emits an optimistic value immediately before the refresh fetch begins; no-op when `reload: true`

# 0.4.0

- `AsyncCubitContainer` now stores cubits in a `List`, allowing multiple instances of the same type to be registered simultaneously
- `AsyncCubitContainer.invalidate<T>()` now invalidates **all** registered cubits of type `T` (previously only one per type); accepts optional `reload` and `filter` parameters
- Removed `AsyncCubitContainer.get<T>()` and `invalidateAll(List<Type>)` — use `invalidate<T>()` directly

# 0.3.0

- Replaced `freezed`-based `AsyncValue` and `MutationState` with native Dart sealed classes — removes `freezed_annotation` and `build_runner` dependencies
- Merged `FutureWithArgsCubit` into `FutureCubit`: concrete subclasses now define their own `load`/`refresh` methods calling `performLoad`/`performRefresh`
- Removed `RefreshStreamFutureCubitMixin`

# 0.2.0

Add `MutationCubit` used to invoke async operations by some side effect (eg. form submit)

# 0.1.0+3

Fix code formatting in README file

# 0.1.0+2

Create `async_cubits` package