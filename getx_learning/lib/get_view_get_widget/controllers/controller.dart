import 'package:get/get.dart';

class MyController extends GetxController {
  RxInt count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    print("Init controller");
  }

  @override
  void onReady() {
    super.onReady();
    print("Ready controller");
  }

  void updateUI() {
    update();
  }

  void increment() {
    ++count;
  }
}
