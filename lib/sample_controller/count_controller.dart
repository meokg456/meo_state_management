import 'package:meo/meo.dart';

class CountController extends SyncMeoController<int> {
  @override
  int init() {
    return 0;
  }

  void increase() {
    state++;
  }
}
