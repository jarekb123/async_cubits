import 'package:async_cubits/async_cubits.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ---------------------------------------------------------------------------
// Test doubles
// ---------------------------------------------------------------------------

class _TestFutureCubit extends FutureCubit<String> {
  _TestFutureCubit({required super.container, this.tag = ''});

  final String tag;
  int _loadCount = 0;

  Future<void> load() => performLoad(
        () async {
          if (_loadCount == 0) {
            _loadCount++;
            return 'data';
          } else {
            _loadCount++;
            return 'data_new';
          }
        },
      );
}

// ignore: one_member_abstracts
abstract class _Api {
  Future<void> save(String input);
}

class _MockApi extends Mock implements _Api {}

class _TestMutationCubit extends MutationCubit<String, void> {
  _TestMutationCubit({
    required _Api api,
    required AsyncCubitContainer container,
  })  : _api = api,
        super(container: container);

  final _Api _api;

  @override
  Future<void> mutation(String input) => _api.save(input);

  @override
  void onSuccess(void result) {
    super.onSuccess(result);
    invalidate<_TestFutureCubit>();
  }
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  late AsyncCubitContainer container;
  late _MockApi api;

  setUp(() {
    container = AsyncCubitContainer();
    api = _MockApi();
  });

  blocTest<_TestFutureCubit, AsyncValue<String>>(
    'AsyncCubit unregisters itself from the container on close',
    build: () => _TestFutureCubit(container: container),
    // blocTest closes the cubit after act; verify runs after close.
    expect: () => isEmpty,
    verify: (_) async {
      // After close, invalidate should be a no-op (nothing to invalidate).
      await expectLater(
        container.invalidate<_TestFutureCubit>(),
        completes,
      );
    },
  );

  blocTest<_TestFutureCubit, AsyncValue<String>>(
    'FutureCubit.invalidate re-runs the last future as a refresh',
    build: () => _TestFutureCubit(container: container),
    act: (cubit) async {
      await cubit.load();
      await cubit.invalidate();
    },
    expect: () => [
      // load: loading → data
      isA<AsyncValue<String>>().having((s) => s.isLoading, 'isLoading', true),
      const AsyncValue<String>.data('data'),
      // invalidate (refresh): loading-with-previous-value → data
      isA<AsyncValue<String>>()
          .having((s) => s.isLoading, 'isLoading', true)
          .having((s) => s.value, 'value', 'data'),
      const AsyncValue<String>.data('data_new'),
    ],
  );

  blocTest<_TestFutureCubit, AsyncValue<String>>(
    'FutureCubit.invalidate does nothing if no previous future',
    build: () => _TestFutureCubit(container: container),
    act: (cubit) async {
      await cubit.invalidate();
    },
    expect: () => isEmpty,
  );

  blocTest<_TestFutureCubit, AsyncValue<String>>(
    'container.invalidate<T> re-runs the last future on the cubit',
    build: () => _TestFutureCubit(container: container),
    act: (cubit) async {
      await cubit.load();
      await container.invalidate<_TestFutureCubit>();
    },
    expect: () => [
      isA<AsyncValue<String>>().having((s) => s.isLoading, 'isLoading', true),
      const AsyncValue<String>.data('data'),
      isA<AsyncValue<String>>()
          .having((s) => s.isLoading, 'isLoading', true)
          .having((s) => s.value, 'value', 'data'),
      const AsyncValue<String>.data('data_new'),
    ],
  );

  blocTest<_TestFutureCubit, AsyncValue<String>>(
    'container.invalidate<T> is a no-op when cubit is not registered',
    build: () => _TestFutureCubit(container: container),
    act: (_) async {
      // Use a fresh container that has no cubit registered.
      await AsyncCubitContainer().invalidate<_TestFutureCubit>();
    },
    expect: () => isEmpty,
  );

  test(
    'container.invalidate<T> invalidates all cubits of type T',
    () async {
      final a = _TestFutureCubit(container: container);
      final b = _TestFutureCubit(container: container);
      await a.load();
      await b.load();

      await container.invalidate<_TestFutureCubit>();

      expect(a.state, const AsyncValue<String>.data('data_new'));
      expect(b.state, const AsyncValue<String>.data('data_new'));

      await a.close();
      await b.close();
    },
  );

  test(
    'container.invalidate<T> with filter only invalidates matching cubits',
    () async {
      final tagged = _TestFutureCubit(container: container, tag: 'target');
      final other = _TestFutureCubit(container: container, tag: 'other');
      await tagged.load();
      await other.load();

      await container.invalidate<_TestFutureCubit>(
        filter: (c) => c.tag == 'target',
      );

      expect(tagged.state, const AsyncValue<String>.data('data_new'));
      expect(other.state, const AsyncValue<String>.data('data'));

      await tagged.close();
      await other.close();
    },
  );

  blocTest<_TestMutationCubit, MutationState<void>>(
    'MutationCubit invalidates listed cubits on success',
    setUp: () => when(() => api.save(any())).thenAnswer((_) async {}),
    build: () => _TestMutationCubit(api: api, container: container),
    act: (cubit) async {
      final futureCubit = _TestFutureCubit(container: container);
      await futureCubit.load();
      expect(futureCubit.state, const AsyncValue<String>.data('data'));

      await cubit.invoke('input');

      await Future<void>.delayed(
        Duration.zero,
      ); // wait for microtasks to complete

      // invalidate re-fetches; by the time invoke completes the refresh has
      // also completed, so the cubit holds fresh data again.
      expect(futureCubit.state, const AsyncValue<String>.data('data_new'));
      await futureCubit.close();
    },
    expect: () => [
      const MutationState<void>.loading(),
      const MutationState<void>.success(null),
    ],
  );

  blocTest<_TestMutationCubit, MutationState<void>>(
    'MutationCubit does not invalidate listed cubits on failure',
    setUp: () =>
        when(() => api.save(any())).thenThrow(Exception('save failed')),
    build: () => _TestMutationCubit(api: api, container: container),
    act: (cubit) async {
      final futureCubit = _TestFutureCubit(container: container);
      await futureCubit.load();
      expect(futureCubit.state, const AsyncValue<String>.data('data'));

      await cubit.invoke('input');

      expect(futureCubit.state, const AsyncValue<String>.data('data'));
      await futureCubit.close();
    },
    expect: () => [
      predicate<MutationState<void>>((s) => s.isLoading),
      predicate<MutationState<void>>((s) => s.isFailure),
    ],
  );
}
