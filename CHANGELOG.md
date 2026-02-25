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