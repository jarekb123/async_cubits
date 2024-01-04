# Effortless Asynchronous Operations in Flutter: Unveiling async_cubits

In the world of Flutter development, managing asynchronous operations can be tricky. Whether it's fetching data from an API or dealing with background tasks, developers often encounter challenges that make their code more complicated or repetitive (copy-pasted). Instead of concentrating on the business logic, we end up writing a lot of boilerplate code to handle the loading, error, and success states of asynchronous operations. Much of that logic can be simplified and represented as reusable code.

**Check existing solutions**
* `ObservableFuture`, `ObservableStream` in MobX
* `FutureProvider`, `StreamProvider`, etc. in Riverpod

So why another solution?

# Motivation

* We wanted to use it in the currently developed app. The app we developed extensively utilized bloc and cubits, so switching the state management solution could potentially introduce new bugs.
* The team was predominantly experienced in utilizing the `bloc` package.
* There is no widely recognized, consistent, abstract way of handling asynchronous operations that removes boilerplate logic for managing loading, error, and success states using bloc/cubit.

# Research 

Our research strategy was simple: don't try to reinvent the wheel and look on what other mature solutions (like Riverpod, MobX, react-query) are doing.

We did like the idea and the behavior of `AsyncValue` used in Riverpod. So we decided to take the simplicity of Riverpod's `FutureProvider` and `StreamProvider` and create similar behavior using cubits from `bloc` package.

# The problem

The problematic code:

```dart
// State
abstract class UserDataState {
  const UserDataState();
}

class UserDataLoading extends UserDataState {
  const UserDataLoading();
}

class UserDataLoaded extends UserDataState {
  final User data;

  const UserDataLoaded(this.data);
}

class UserDataError extends UserDataState {
  final Object error;
  final StackTrace stackTrace;

  const UserDataError(this.error, this.stackTrace);
}

// Cubit
class UserDataCubit extends Cubit<UserDataState> {
  final UserRepository _repository;

  DataCubit(this._repository) : super(const DataLoading());

  Future<void> fetchData() async {
    emit(DataLoading());

    try {
      final fetchedData = await _repository.getUser();
      emit(DataLoaded(fetchedData));
    } catch (e, st) {
      emit(DataError(e, st));
    }
  }
}
```

As we can see most of the code is not connected to the business logic, but it's a boilerplate code for handling async fetch operation. Even in the small app, this repeated logic will appear several times, so it's better to handle them in a consistent way.

# `async_cubits` package

The package [`async_cubits`](https://github.com/jarekb123/async_cubits) contains a set of cubits:

* `FutureCubit` - implements logic for handling loading, error, and success states and provides methods for reloading and seamlessly refreshing data. Typically used to fetch data from some external data source (eg. REST API, GraphQL, local database).
* `StreamCubit` - implements logic for handling loading, error, and success states for async `Stream` events. Typically used when the app uses reactive data sources (eg. listenening to Firestore's document changes).
* `MutationCubit` - implements logic for handling async operations that are invoked by some side effect, eg. when a user taps some button. Typically used to mutate state of the backend.

> `MutationCubit` will be described in next article.


## How to use `FutureCubit`?

1. To create `FutureCubit` you just need to implement its `future` method.

```dart
class UserDataCubit extends FutureCubit<User> {
  final UserRepository _repository;

  UserDataCubit(this._repository);
  
  @override
  Future<User> future() => _userRepository.getUser();
}
```

2. To fetch the data for the first time, use `load` method

```dart
cubit.load();
```

In most cases, the data should be fetched when the bloc is created. `BlocProvider` can be used for that:

```dart
BlocProvider(
  create: (context) => UserDataCubit(
    context.read<UserRepository>(),
  )..load(),
  child: UserPageBody(),
)
```

3. To react to state changes of the `FutureCubit` UI, you can use `when` method on `cubit.state` which type will be `AsyncValue<User>`.

```dart
class UserPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<UserDataCubit>();
    final state = cubit.state;

    return state.when(
      loading: LoadingWidget.new,
      error: (error, stackTrace) => ErrorWidget(error),
      data: (data) => UserLoadedWidget(data),
    );
  }
}
```


4. To refresh the data use `refresh()` method

```dart
ElevatedButton(
  onPressed: () => cubit.refresh(),
  child: Text('Refresh'),
)
```

During refresh, the `AsyncValue.when` method by default will use `data` callback if the data was previously fetched.

## Future with arguments

There are 2 methods of passing arguments to async method.

1. Inject arguments through constructor of `FutureCubit`

```dart
class UserDataCubit extends FutureCubit<User> {
  final UserRepository _repository;
  final String userId;

  UserDataCubit(this._repository, {required this.userId});
  
  @override
  Future<User> future() => _repository.getUserById(userId);
}
```

It works, but there's no way of reloading/refreshing with new arguments through the lifetime of the cubit.

Solution: recreate the cubit when the arguments are changed, eg. using `Key` in `BlocProvider`.

```dart
BlocProvider(
  key: ValueKey(userId),
  create: (context) => UserDataCubit(
    context.read<UserRepository>(),
    userId: userId,
  )..load(),
  child: UserPageBody(),
)
```

This will recreate the whole widget tree when the `userId` is updated. This may cause some performance issues.

2. Use `FutureWithArgsCubit`

```dart
class UserDataCubit extends FutureWithArgsCubit<String, User> {
  final UserRepository _repository;

  UserDataCubit(this._repository);
  
  @override
  Future<User> future(String userId) => _repository.getUserById(userId);
}
```

This type of cubit enables to pass arguments through `load(args)` and `refresh(args)` methods.

Example:

```dart
BlocProvider(
  create: (context) => UserDataCubit(
    context.read<UserRepository>(),
  )..load(userId),
  child: UserPageBody(),
)
```

and to refresh with new arguments use:

```dart
cubit.refresh(newUserId);
```

## How to use `StreamCubit`?

1. Implement `dataStream` method 

```dart
class NewMessageCubit extends StreamCubit<Message> {
  final MessageRepository _messageRepository;

  GetMessagesCubit(this._messageRepository);
  
  @override
  Stream<Message> dataStream() => _messageRepository.newMessageStream();
}
```

2. Subscribe

```dart
BlocProvider(
  create: (context) => NewMessageCubit(
    context.read<MessageRepository>(),
  )..subscribe(),
  child: NewMessageWidget(),
)
```

3. `StreamCubit` emits `AsyncValue`, so listening to state changes is similar to that in `FutureCubit`

```dart
class NewMessageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<NewMessageCubit>();
    final state = cubit.state;

    return state.when(
      loading: LoadingWidget.new,
      error: (error, stackTrace) => ErrorWidget(error),
      data: (data) => LoadedMessage(data),
    );
  }
}
```

# See more

As you can observe, the `FutureCubit` or `StreamCubit` significantly
reduces the amount of code needed to handle states for asynchronous data.

Check out the package on [pub.dev](https://pub.dev/packages/async_cubits) and [GitHub](https://github.com/jarekb123/async_cubits).

In the next article, I will describe the usage of `MutationCubit`, which is also a part of the `async_cubits` package.