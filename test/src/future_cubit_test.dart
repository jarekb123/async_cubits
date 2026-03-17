import 'package:async_cubits/async_cubits.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks.dart';

void main() {
  test('initial state', () {
    expect(TestFutureCubit().state, const AsyncValue<String>.loading());
  });

  blocTest<TestFutureCubit, AsyncValue<String>>(
    'load emits loading and data',
    build: TestFutureCubit.new,
    act: (cubit) => cubit.load(),
    expect: () => [
      const AsyncValue<String>.loading(),
      const AsyncValue<String>.data('data'),
    ],
    verify: (bloc) {
      expect(bloc.futureCalls, 1);
    },
  );

  blocTest<TestFutureCubit, AsyncValue<String>>(
    'load emits loading and error',
    build: () => TestFutureCubit(throwsError: true),
    act: (cubit) => cubit.load(),
    expect: () => [
      const AsyncValue<String>.loading(),
      predicate<AsyncValue<String>>(
        (value) =>
            value.error is Exception &&
            value.stackTrace != null &&
            !value.hasValue,
      ),
    ],
    verify: (bloc) {
      expect(bloc.futureCalls, 1);
    },
  );

  blocTest<TestFutureCubit, AsyncValue<String>>(
    'refresh() before load emits loading and data',
    build: TestFutureCubit.new,
    act: (cubit) => cubit.refresh(),
    expect: () => [
      const AsyncValue<String>.loading(),
      const AsyncValue<String>.data('data'),
    ],
    verify: (bloc) {
      expect(bloc.futureCalls, 1);
    },
  );

  blocTest<TestFutureCubit, AsyncValue<String>>(
    'if data is already loaded, refresh() emits AsyncValue that hasValue '
    'and isLoading',
    build: TestFutureCubit.new,
    seed: () => const AsyncValue<String>.data('data'),
    act: (bloc) => bloc.refresh(),
    expect: () => [
      predicate<AsyncValue<String>>(
        (value) => value.hasValue && value.isLoading,
      ),
      const AsyncValue<String>.data('data'),
    ],
  );

  blocTest<TestFutureCubit, AsyncValue<String>>(
    'if data is already loaded and fetching fails, refresh() '
    'emits AsyncValue that hasValue and isLoading '
    'then emits AsyncValue that hasError with previous data',
    build: () => TestFutureCubit(throwsError: true),
    seed: () => const AsyncValue<String>.data('data'),
    act: (bloc) => bloc.refresh(),
    expect: () => [
      predicate<AsyncValue<String>>(
        (value) => value.hasValue && value.isLoading,
      ),
      predicate<AsyncValue<String>>(
        (value) =>
            value.error is Exception &&
            value.stackTrace != null &&
            value.hasValue &&
            value.value == 'data' &&
            !value.isLoading,
      ),
    ],
  );

  blocTest<TestFutureCubit, AsyncValue<String>>(
    'invalidate with optimisticRefresh emits optimistic value before refresh',
    build: TestFutureCubit.new,
    seed: () => const AsyncValue<String>.data('old'),
    act: (cubit) async {
      await cubit.load(); // sets _lastFuture
      await cubit.invalidate(
        optimisticRefresh: (current) => 'optimistic',
      );
    },
    expect: () => [
      // load
      const AsyncValue<String>.loading(),
      const AsyncValue<String>.data('data'),
      // invalidate: optimistic emit, then loading+value, then final data
      const AsyncValue<String>.data('optimistic'),
      predicate<AsyncValue<String>>(
        (value) => value.hasValue && value.isLoading,
      ),
      const AsyncValue<String>.data('data'),
    ],
  );

  blocTest<TestFutureCubit, AsyncValue<String>>(
    'invalidate with optimisticRefresh is no-op when reload is true',
    build: TestFutureCubit.new,
    seed: () => const AsyncValue<String>.data('old'),
    act: (cubit) async {
      await cubit.load();
      await cubit.invalidate(
        reload: true,
        optimisticRefresh: (current) => 'optimistic',
      );
    },
    expect: () => [
      // load
      const AsyncValue<String>.loading(),
      const AsyncValue<String>.data('data'),
      // invalidate reload: no optimistic emit, just plain load
      const AsyncValue<String>.loading(),
      const AsyncValue<String>.data('data'),
    ],
  );

  blocTest<TestFutureCubit, AsyncValue<String>>(
    'invalidate with optimisticRefresh does not emit optimistic value '
    'when state has no value',
    build: TestFutureCubit.new,
    act: (cubit) async {
      await cubit.load();
      await cubit.invalidate(
        optimisticRefresh: (current) => 'optimistic',
      );
    },
    expect: () => [
      // load
      const AsyncValue<String>.loading(),
      const AsyncValue<String>.data('data'),
      // invalidate: state has value now, so optimistic fires
      const AsyncValue<String>.data('optimistic'),
      predicate<AsyncValue<String>>(
        (value) => value.hasValue && value.isLoading,
      ),
      const AsyncValue<String>.data('data'),
    ],
  );
}
