# async_cubits

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

A package that provides set of cubits for making asynchronous operations in simpler, consistent way.

## Installation 💻

**❗ In order to start using Async Cubits you must have the [Flutter SDK][flutter_install_link] installed on your
machine.**

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

FutureCubits are a type of Cubit that can be used to make asynchronous operations that return a value.
E.g. fetching data from API.

```dart
class GetUserCubit extends FutureCubit<User> {
  final UserRepository _userRepository;

  GetUserCubit(this._userRepository);
  
  @override
  Future<User> future() => _userRepository.getUser();
}
```

#### Load the async data

To trigger the async data fetching, use `load()` method.

When the `load()` is called, the cubit emits in following order:

* `AsyncValue.loading()`
* if the operation succeeds and data is avaialable `AsyncValue.data(fetchedData)`
* if the operation fails - `AsyncValue.error(error, stackTrace)`

In your UI you can use BlocProvider and BlocBuilder to load and access the data.

```dart
BlocProvider(
  create: (context) => GetUserCubit(
    context.read<UserRepository>(),
  )..load(), // load the data when the cubit is created
  child: BlocBuilder<GetUserCubit, AsyncState<User>>(
    builder: (context, state) {
      return state.when(
        loading: () => CircularProgressIndicator(),
        error: (error) => Text(error),
        data: (user) => Text(user.name),
      );
    },
  ),
);
```

#### Triggering refresh

If you want to trigger refresh of the data you can call the `refresh` method on the cubit.

```dart
ElevatedButton(
  onPressed: () => context.read<GetUserCubit>().refresh(),
  child: Text('Refresh'),
),
```


When the `refresh()` is called, the cubit emits state in following order that:

* `isLoading` is `true` and `value` contains the previously loaded value, which helps to show the UI with previously loaded content, then immediately switch to new value without showing loading indicator. If you want to show loading indicator instead, set `skipLoadingOnRefresh` to `false` when using `AsyncValue.when`
* if the operation succeeds and new value is available, then the state's `isLoading` changes to `false` and `value` contains new value
* if the operation fails - state's `isLoading` changes to `false`, `error` and `stackTrace` is not null, and `value` contains previously loaded value. That behavior enables showing UI with previously loaded content with a refresh error message (to achieve that, use `skipError` in `AsyncValue.when` method)


So according to the example above, if the data was fetched successfully, the `Text(user.name)` will be rendered
and no loading indicator will be shown when the cubit is refreshed.

#### Loading/refreshing with new arguments

To load/refresh the data with new arguments that are passed to the `future` method, use `FutureWithArgsCubit`. The behaviour of this cubit is similar to `FutureCubit`.

```dart
class GetUserByIdCubit extends FutureWithArgsCubit<int, User> {
  final UserRepository _userRepository;

  GetUserCubit(this._userRepository);
  
  @override
  Future<User> future(int id) => _userRepository.getUserById(id);
}
```

and then call `load` or `refresh` with the arguments.

```dart
context.read<GetUserByIdCubit>().load(1);
```

or

```dart
context.read<GetUserByIdCubit>().refresh(1);
```

### Creating a StreamCubit

StreamCubits are a type of Cubit that can be used to listen to async stream of events.
E.g. listening to a stream of data from a websocket.

```dart
class NewMessageCubit extends StreamCubit<Message> {
  final MessageRepository _messageRepository;

  GetMessagesCubit(this._messageRepository);
  
  @override
  Stream<Message> dataStream() => _messageRepository.newMessageStream();
}
```

[flutter_install_link]: https://docs.flutter.dev/get-started/install

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg

[license_link]: https://opensource.org/licenses/MIT

[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only

[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only

[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg

[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis