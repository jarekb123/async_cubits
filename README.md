# async_cubits

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

A package that provides a set of cubits for making asynchronous operations in a simpler, consistent way.

### Inspiration

This package is inspired by Riverpod's `FutureProvider` and `StreamProvider`. The `AsyncValue` class is mostly the same as in the `riverpod` package. Please check the great work done there.

## Installation 💻

**❗ In order to start using Async Cubits you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

```sh
flutter pub add async_cubits
```

---

## Usage 🚀

### Importing the package

```dart
import 'package:async_cubits/async_cubits.dart';
```

### Using a FutureCubit

`FutureCubit` is a cubit for async operations that return a value (e.g. fetching data from an API).

Concrete subclasses define their own `load`/`refresh` methods and call `performLoad` or `performRefresh` with the appropriate future factory.

#### Without args

```dart
class GetUserCubit extends FutureCubit<User> {
  GetUserCubit(this._userRepository);

  final UserRepository _userRepository;

  Future<void> load() => performLoad(_userRepository.getUser);
  Future<void> refresh() => performRefresh(_userRepository.getUser);
}
```

#### With args

```dart
class GetUserByIdCubit extends FutureCubit<User> {
  GetUserByIdCubit(this._userRepository);

  final UserRepository _userRepository;

  Future<void> load(int id) => performLoad(() => _userRepository.getUserById(id));
  Future<void> refresh(int id) => performRefresh(() => _userRepository.getUserById(id));
}
```

#### Loading data

Call `load()` to trigger the async operation. The cubit emits `AsyncValue<T>` in the following order:

1. `AsyncValue.loading()`
2. `AsyncValue.data(value)` on success, or `AsyncValue.error(error, stackTrace)` on failure

In your UI, use `BlocProvider` and `BlocBuilder`:

```dart
BlocProvider(
  create: (context) => GetUserCubit(
    context.read<UserRepository>(),
  )..load(),
  child: BlocBuilder<GetUserCubit, AsyncValue<User>>(
    builder: (context, state) {
      return state.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text('$error'),
        data: (user) => Text(user.name),
      );
    },
  ),
);
```

#### Refreshing data

Call `refresh()` to reload without clearing the previously loaded value. The cubit emits:

1. A state where `isLoading` is `true` and `value` holds the previous data — useful for showing existing content while reloading without a loading indicator. Set `skipLoadingOnRefresh: false` in `AsyncValue.when` to show a loading indicator instead.
2. `AsyncValue.data(newValue)` on success.
3. On failure, a state where `isLoading` is `false`, `error`/`stackTrace` are set, and `value` still holds the previous data — useful for showing the previous content alongside an error message (use `skipError: true` in `AsyncValue.when`).

```dart
ElevatedButton(
  onPressed: () => context.read<GetUserCubit>().refresh(),
  child: const Text('Refresh'),
),
```

### Using a StreamCubit

`StreamCubit` listens to an async stream of values (e.g. a websocket feed).

```dart
class NewMessageCubit extends StreamCubit<Message> {
  NewMessageCubit(this._messageRepository);

  final MessageRepository _messageRepository;

  @override
  Stream<Message> dataStream() => _messageRepository.newMessageStream();
}
```

`StreamCubit` emits `AsyncValue<T>`, so consuming state is identical to `FutureCubit`:

```dart
class NewMessageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<NewMessageCubit>().state;

    return state.when(
      loading: LoadingWidget.new,
      error: (error, stackTrace) => ErrorWidget(error),
      data: (message) => LoadedMessage(message),
    );
  }
}
```

### Using a MutationCubit

`MutationCubit` handles asynchronous mutations — API calls, database writes, form submissions, etc.

```dart
class SaveUserCubit extends MutationCubit<User, void> {
  SaveUserCubit(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<void> mutation(User input) => _userRepository.saveUser(input);
}
```

Invoke the mutation with `invoke`:

```dart
context.read<SaveUserCubit>().invoke(user);
```

`MutationCubit` emits `MutationState<T>`, a sealed class with four subtypes:

| State | Type | Description |
|---|---|---|
| Idle | `MutationIdle` | Initial state — mutation not yet invoked |
| Loading | `MutationLoading` | Mutation in progress |
| Success | `MutationSuccess` | Mutation completed — holds `result` |
| Failure | `MutationFailure` | Mutation failed — holds `error` and `stackTrace` |

Use pattern matching or the `is` checks (`isLoading`, `isSuccess`, `isFailure`) to react to state changes:

```dart
BlocBuilder<SaveUserCubit, MutationState<void>>(
  builder: (context, state) {
    return switch (state) {
      MutationIdle() || MutationSuccess() => SaveButton(),
      MutationLoading() => const CircularProgressIndicator(),
      MutationFailure(:final error) => Text('Failed: $error'),
    };
  },
)
```

[flutter_install_link]: https://docs.flutter.dev/get-started/install

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg

[license_link]: https://opensource.org/licenses/MIT

[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg

[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
