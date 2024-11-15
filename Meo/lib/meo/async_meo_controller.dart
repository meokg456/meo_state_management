import 'dart:async';

import 'package:meo/meo/async_state.dart';
import 'package:meo/meo/sync_meo_controller.dart';

abstract class AsyncMeoController<T> extends SyncMeoController<AsyncState<T>> {
  @override
  AsyncState<T> init() {
    return AsyncState<T>();
  }

  void call(Future<T> function) {
    state = state.copyWith(status: Status.loading);
    function.then((value) {
      state = state.copyWith(status: Status.success, data: value);
    }, onError: (error) {
      state = state.copyWith(status: Status.error, error: error);
    });
  }
}
