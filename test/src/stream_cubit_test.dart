import 'package:async_cubits/async_cubits.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks.dart';

void main() {
  group('StreamCubit', () {
    blocTest<TestStreamCubit, AsyncValue<int>>(
      'has loading initial state',
      build: TestStreamCubit.new,
      verify: (bloc) => expect(bloc.state, const AsyncValue<int>.loading()),
    );

    blocTest<TestStreamCubit, AsyncValue<int>>(
      'subscribe() subscribes to dataStream',
      build: TestStreamCubit.new,
      act: (bloc) async {
        bloc.subscribe();
        expect(bloc.controller.hasListener, isTrue);
      },
    );

    blocTest<TestStreamCubit, AsyncValue<int>>(
      'subscribe() emits data from dataStream',
      build: TestStreamCubit.new,
      act: (bloc) async {
        bloc.subscribe();
        bloc.controller.add(1);
      },
      expect: () => [
        const AsyncValue<int>.loading(),
        const AsyncValue<int>.data(1),
      ],
    );

    final stackTrace = StackTrace.current;
    blocTest<TestStreamCubit, AsyncValue<int>>(
      'emits error from dataStream()',
      build: TestStreamCubit.new,
      act: (bloc) async {
        bloc.subscribe();
        bloc.controller.addError('error', stackTrace);
      },
      expect: () => [
        const AsyncValue<int>.loading(),
        AsyncValue<int>.error('error', stackTrace),
      ],
    );

    test('close cancels subscription', () {
      final bloc = TestStreamCubit()
        ..subscribe()
        ..close();
      expect(bloc.controller.hasListener, isFalse);
    });
  });
}
