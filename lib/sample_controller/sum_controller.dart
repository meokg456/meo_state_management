import 'package:meo/meo.dart';

class SumController extends AsyncMeoController<int> {
  Future<int> calculateSum(int a, int b) {
    return Future.delayed(const Duration(seconds: 2), () {
      return a + b;
    });
  }
}
