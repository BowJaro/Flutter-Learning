import 'package:get/get.dart';

class MyGetBuilderController extends GetxController {
  int count = 0;

  void increment() {
    ++count;
    update();
  }

  void decrement() {
    --count;
    update();
  }
}
