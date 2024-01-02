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
}
