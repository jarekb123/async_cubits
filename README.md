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

#### Integrating with UI widgets

In your UI you can use BlocProvider and BlocBuilder to load and access the data.

```
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

```
ElevatedButton(
  onPressed: () => context.read<GetUserCubit>().refresh(),
  child: Text('Refresh'),
),
```

By default, the `AsyncValue.when` method will use `data` callback if the data was previously fetched.

So according to the example above, if the data was fetched successfully, the `Text(user.name)` will be rendered
and no loading indicator will be shown when the cubit is refreshed.

#### Loading/refreshing with new arguments

To load/refresh the data with new arguments that are passed to the `future` method, use `FutureWithArgsCubit`.

```
class GetUserByIdCubit extends FutureWithArgsCubit<int, User> {
  final UserRepository _userRepository;

  GetUserCubit(this._userRepository);
  
  @override
  Future<User> future(int id) => _userRepository.getUserById(id);
}
```

and then call `load` or `refresh` with the arguments.

```
context.read<GetUserByIdCubit>().load(1);
```

or

```
context.read<GetUserByIdCubit>().refresh(1);
```

### Creating a StreamCubit

StreamCubits are a type of Cubit that can be used to listen to async stream of events.
E.g. listening to a stream of data from a websocket.

```
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