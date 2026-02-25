import 'package:async_cubits/async_cubits.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

// ignore: one_member_abstracts
abstract class _Caller {
  Future<String> call(String args);
}

class _MockCaller extends Mock implements _Caller {}

class _TestFutureWithArgsCubit extends FutureCubit<String> {
  _TestFutureWithArgsCubit({required this.caller});

  final _Caller caller;

  Future<void> load(String args) => performLoad(() => caller.call(args));

  Future<void> refresh(String args) =>
      performRefresh(() => caller.call(args));
}

void main() {
  test('initial state', () {
    expect(TestFutureWithArgsCubit().state, const AsyncValue<String>.loading());
  });

  blocTest<TestFutureWithArgsCubit, AsyncValue<String>>(
    'load emits loading and data',
    build: TestFutureWithArgsCubit.new,
    act: (cubit) => cubit.load('args'),
    expect: () => [
      const AsyncValue<String>.loading(),
      const AsyncValue<String>.data('data'),
    ],
    verify: (bloc) {
      expect(bloc.futureCalls, 1);
    },
  );

  blocTest<TestFutureWithArgsCubit, AsyncValue<String>>(
    'load emits loading and error',
    build: () => TestFutureWithArgsCubit(throwsError: true),
    act: (cubit) => cubit.load('args'),
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

  blocTest<TestFutureWithArgsCubit, AsyncValue<String>>(
    'if data is already loaded, refresh() emits AsyncValue that hasValue '
    'and isLoading',
    build: TestFutureWithArgsCubit.new,
    seed: () => const AsyncValue<String>.data('data'),
    act: (bloc) async {
      await bloc.refresh('args');
    },
    expect: () => [
      predicate<AsyncValue<String>>(
        (value) => value.hasValue && value.isLoading,
      ),
      const AsyncValue<String>.data('data'),
    ],
  );

  blocTest<TestFutureWithArgsCubit, AsyncValue<String>>(
    'if data is already loaded and fetching fails, '
    'refresh() emits AsyncValue that hasValue and isLoading '
    'then emits AsyncValue that hasError with previous data',
    build: () => TestFutureWithArgsCubit(throwsError: true),
    seed: () => const AsyncValue<String>.data('data'),
    act: (bloc) => bloc.refresh('args'),
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

  group('', () {
    late _MockCaller caller;

    setUp(() {
      caller = _MockCaller();
      when(() => caller.call(any())).thenAnswer((_) async => 'data');
    });

    blocTest<_TestFutureWithArgsCubit, AsyncValue<String>>(
      'load passes args to future',
      build: () => _TestFutureWithArgsCubit(caller: caller),
      act: (cubit) => cubit.load('args'),
      verify: (_) {
        verify(() => caller.call('args')).called(1);
      },
    );

    blocTest<_TestFutureWithArgsCubit, AsyncValue<String>>(
      'refresh passes args to future',
      build: () => _TestFutureWithArgsCubit(caller: caller),
      act: (cubit) => cubit.refresh('other'),
      verify: (_) {
        verify(() => caller.call('other')).called(1);
      },
    );

    blocTest<_TestFutureWithArgsCubit, AsyncValue<String>>(
      'load, then refresh passes args to future in order',
      build: () => _TestFutureWithArgsCubit(caller: caller),
      act: (cubit) async {
        await cubit.load('args');
        await cubit.refresh('other');
      },
      verify: (_) {
        verifyInOrder([
          () => caller.call('args'),
          () => caller.call('other'),
        ]);
      },
    );
  });
}
