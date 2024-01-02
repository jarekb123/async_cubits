import 'dart:async';

import 'package:async_cubits/async_cubits.dart';

class TestFutureCubit extends FutureCubit<String> {
  TestFutureCubit({this.throwsError = false});

  final bool throwsError;

  int futureCalls = 0;

  @override
  Future<String> future() async {
    futureCalls++;
    if (throwsError) {
      throw Exception('error');
    }
    return 'data';
  }
}

class TestFutureWithArgsCubit extends FutureWithArgsCubit<String, String> {
  TestFutureWithArgsCubit({this.throwsError = false});

  final bool throwsError;

  int futureCalls = 0;

  @override
  Future<String> future(String args) async {
    futureCalls++;
    if (throwsError) {
      throw Exception('error');
    }
    return 'data';
  }
}

class TestStreamCubit extends StreamCubit<int> {
  final controller = StreamController<int>();

  @override
  Stream<int> dataStream() => controller.stream;
}
