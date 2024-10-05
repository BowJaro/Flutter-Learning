// lib/controllers/obx_heavy_controller.dart
import 'dart:async';
import 'package:get/get.dart';

class MyObxHeavyController extends GetxController {
  // Multiple observable variables
  var count1 = 0.obs;
  var count2 = 0.obs;
  var count3 = 0.obs;
  var count4 = 0.obs;
  var count5 = 0.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    // Initialize a timer to update counts every second
    _timer = Timer.periodic(const Duration(seconds: 100), (timer) {
      incrementAll();
    });
  }

  void increment1() => count1.value++;
  void increment2() => count2.value++;
  void increment3() => count3.value++;
  void increment4() => count4.value++;
  void increment5() => count5.value++;

  void incrementAll() {
    count1.value++;
    count2.value++;
    count3.value++;
    count4.value++;
    count5.value++;
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
