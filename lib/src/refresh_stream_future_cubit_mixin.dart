import 'dart:async';

import 'package:async_cubits/async_cubits.dart';

/// Mixin for [FutureCubit] that refreshes the data (triggers [refresh] method)
/// when a refresh event is received from a [refreshEvents] stream.
///
/// The [refreshEvents] stream is subscribed when the [load] method is called.
mixin RefreshStreamFutureCubitMixin<T> on FutureCubit<T> {
  /// Stream of events, that triggers [refresh] method.
  Stream<Object> get refreshEvents;

  StreamSubscription<Object>? _refreshSubscription;

  @override
  Future<void> close() {
    _refreshSubscription?.cancel();
    return super.close();
  }

  @override
  Future<void> load() {
    _refreshSubscription?.cancel();
    _refreshSubscription = refreshEvents.listen((_) => refresh());
    return super.load();
  }
}
