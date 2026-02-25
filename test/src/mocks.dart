import 'dart:async';

import 'package:async_cubits/async_cubits.dart';

class TestFutureCubit extends FutureCubit<String> {
  TestFutureCubit({this.throwsError = false});

  final bool throwsError;

  int futureCalls = 0;

  Future<String> _future() async {
    futureCalls++;
    if (throwsError) {
      throw Exception('error');
    }
    return 'data';
  }

  Future<void> load() => performLoad(_future);

  Future<void> refresh() => performRefresh(_future);
}

class TestFutureWithArgsCubit extends FutureCubit<String> {
  TestFutureWithArgsCubit({this.throwsError = false});

  final bool throwsError;

  int futureCalls = 0;

  Future<String> _future(String args) async {
    futureCalls++;
    if (throwsError) {
      throw Exception('error');
    }
    return 'data';
  }

  Future<void> load(String args) => performLoad(() => _future(args));

  Future<void> refresh(String args) => performRefresh(() => _future(args));
}

class TestStreamCubit extends StreamCubit<int> {
  final controller = StreamController<int>();

  @override
  Stream<int> dataStream() => controller.stream;
}
