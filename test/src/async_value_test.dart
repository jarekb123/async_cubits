import 'package:async_cubits/async_cubits.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const loadingValue = AsyncValue<String>.loading();
  const dataValue = AsyncValue<String>.data('data');
  const errorValue = AsyncValue<String>.error('error', StackTrace.empty);

  test('AsyncValue<T>.loading()', () {
    expect(loadingValue.isLoading, isTrue);
    expect(loadingValue.hasValue, isFalse);
    expect(loadingValue.value, isNull);
    expect(loadingValue.error, isNull);
    expect(loadingValue.stackTrace, isNull);
  });

  test('AsyncValue<T>.data()', () {
    expect(dataValue.isLoading, isFalse);
    expect(dataValue.hasValue, isTrue);
    expect(dataValue.value, 'data');
    expect(dataValue.error, isNull);
    expect(dataValue.stackTrace, isNull);
  });

  test('AsyncValue<T>.error()', () {
    expect(errorValue.isLoading, isFalse);
    expect(errorValue.hasValue, isFalse);
    expect(errorValue.value, isNull);
    expect(errorValue.error, 'error');
    expect(errorValue.stackTrace, StackTrace.empty);
  });

  group('AsyncValue<T>.mergeWithPrevious()', () {
    test('loading merge with data', () {
      final merged = loadingValue.mergeWithPrevious(dataValue);

      expect(merged.isLoading, isTrue);
      expect(merged.hasValue, isTrue);
      expect(merged.value, 'data');
      expect(merged.error, isNull);
      expect(merged.stackTrace, isNull);
    });
    test('loading merge with error', () {
      final merged = loadingValue.mergeWithPrevious(errorValue);

      expect(merged.isLoading, isTrue);
      expect(merged.hasValue, isFalse);
      expect(merged.value, isNull);
      expect(merged.error, 'error');
      expect(merged.stackTrace, StackTrace.empty);
    });
    test('error merged with data', () {
      final merged = errorValue.mergeWithPrevious(dataValue);

      expect(merged.isLoading, isFalse);
      expect(merged.hasValue, isTrue);
      expect(merged.value, 'data');
      expect(merged.error, 'error');
      expect(merged.stackTrace, StackTrace.empty);
    });
    test('error merged with loading', () {
      final merged = errorValue.mergeWithPrevious(loadingValue);

      expect(merged.isLoading, isFalse);
      expect(merged.hasValue, isFalse);
      expect(merged.value, isNull);
      expect(merged.error, 'error');
      expect(merged.stackTrace, StackTrace.empty);
    });
    test('data merged with loading', () {
      final merged = dataValue.mergeWithPrevious(loadingValue);

      expect(merged.isLoading, isFalse);
      expect(merged.hasValue, isTrue);
      expect(merged.value, 'data');
      expect(merged.error, isNull);
      expect(merged.stackTrace, isNull);
    });
    test('data merged with error', () {
      final merged = dataValue.mergeWithPrevious(errorValue);

      expect(merged.isLoading, isFalse);
      expect(merged.hasValue, isTrue);
      expect(merged.value, 'data');
      expect(merged.error, isNull);
      expect(merged.stackTrace, isNull);
    });
  });

  group('when (skipLoadingOnRefresh: true)', () {
    test(
      'returns data result if dataValue is merged with loadingValue',
      () {
        final merged = dataValue.mergeWithPrevious(loadingValue);
        final result = merged.when(
          skipLoadingOnRefresh: true,
          data: (_) => 'expected',
          error: (_, __) => 'error',
          loading: () => 'loading',
        );
        expect(result, 'expected');
      },
    );

    test(
      'returns error result if errorValue is merged with loadingValue',
      () {
        final merged = errorValue.mergeWithPrevious(loadingValue);
        final result = merged.when(
          skipLoadingOnRefresh: true,
          data: (_) => 'data',
          error: (_, __) => 'expected',
          loading: () => 'loading',
        );
        expect(result, 'expected');
      },
    );
  });

  group(
    'when (skipError: true)',
    () {
      test(
        'returns data result if dataValue is merged with errorValue',
        () {
          final merged = dataValue.mergeWithPrevious(errorValue);
          final result = merged.when(
            skipError: true,
            data: (_) => 'expected',
            error: (_, __) => 'error',
            loading: () => 'loading',
          );
          expect(result, 'expected');
        },
      );
    },
  );

  test(
    'maybeWhen returns orElse result if case not provided',
    () {
      final dataResult = dataValue.maybeWhen(
        loading: () => 'loading',
        error: (error, stackTrace) => 'error',
        orElse: () => 'expected',
      );
      expect(dataResult, 'expected');

      final errorResult = errorValue.maybeWhen(
        loading: () => 'loading',
        data: (data) => 'data',
        orElse: () => 'expected',
      );
      expect(errorResult, 'expected');

      final loadingResult = loadingValue.maybeWhen(
        data: (data) => 'data',
        error: (error, stackTrace) => 'error',
        orElse: () => 'expected',
      );
      expect(loadingResult, 'expected');
    },
  );
}
