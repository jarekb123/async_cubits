import 'package:flutter/foundation.dart';

/// Function type for logging info messages from `async_cubits` package
typedef AsyncCubitLoggerInfo = void Function(
  String key,
  String message,
);

/// Function type for logging error messages from `async_cubits` package
typedef AsyncCubitLoggerError = void Function(
  String key,
  String message,
  Object error,
  StackTrace? stackTrace,
);

/// Class for logging info and error messages from `async_cubits` package
final class AsyncCubitsLogger {
  AsyncCubitsLogger._();

  /// Logs debug messages.
  ///
  /// Assign custom function to override default logger.
  static AsyncCubitLoggerInfo debug = info;

  /// Logs info messages.
  ///
  /// Assign custom function to override default logger.
  static AsyncCubitLoggerInfo info = _defaultInfoLogger;

  /// Logs error messages.
  ///
  /// Assign custom function to override default logger (eg. to send errors to
  /// crashlytics).
  static AsyncCubitLoggerError error = _defaultErrorLogger;

  static void _defaultInfoLogger(String key, String message) {
    debugPrint('$key: $message');
  }

  static void _defaultErrorLogger(
    String key,
    String message,
    Object error,
    StackTrace? stackTrace,
  ) {
    debugPrint('$key: $message');
    debugPrint(error.toString());
    debugPrintStack(stackTrace: stackTrace);
  }
}
