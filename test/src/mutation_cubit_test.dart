import 'package:async_cubits/async_cubits.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

abstract class _Backend {
  Future<int> mutateBackend(String input) async => 1;
}

class _MockBackend extends Mock implements _Backend {}

class _TestMutationCubit extends MutationCubit<String, int> {
  _TestMutationCubit(this.backend) : super();

  final _Backend backend;

  @override
  Future<int> mutation(String input) => backend.mutateBackend(input);
}

void main() {
  late _MockBackend backend;

  setUp(() {
    backend = _MockBackend();
  });

  group('MutationCubit', () {
    blocTest<MutationCubit<String, int>, MutationState<int>>(
      'emits [loading, success] when mutation is successful',
      setUp: () => when(() => backend.mutateBackend(any())).thenAnswer(
        (_) async => 1,
      ),
      build: () => _TestMutationCubit(backend),
      act: (cubit) => cubit.invoke('input'),
      expect: () => [
        const MutationState<int>.loading(),
        const MutationState<int>.success(1),
      ],
    );

    blocTest<MutationCubit<String, int>, MutationState<int>>(
      'emits [loading, failure] when mutation fails',
      setUp: () => when(() => backend.mutateBackend(any())).thenThrow(
        Exception(),
      ),
      build: () => _TestMutationCubit(backend),
      act: (cubit) => cubit.invoke('input'),
      expect: () => [
        predicate<MutationState<int>>(
          (state) => state.isLoading,
          'isLoading',
        ),
        predicate<MutationState<int>>(
          (state) => state.isFailure,
          'isFailure',
        ),
      ],
    );
  });
}
