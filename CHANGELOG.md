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