import 'package:flutter/cupertino.dart';

abstract class SyncMeoController<T extends Object> extends ChangeNotifier {
  late T _state;

  SyncMeoController() {
    _state = init();
  }

  T init();

  void reset() {
    state = init();
  }

  @protected
  set state(T state) {
    if (_state == state) {
      return;
    }
    _state = state;
    notifyListeners();
  }

  T get state => _state;
}
