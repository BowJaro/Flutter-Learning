// lib/controllers/get_builder_heavy_controller.dart
import 'dart:async';
import 'package:get/get.dart';

class MyGetBuilderHeavyController extends GetxController {
  // Multiple counters
  int count1 = 0;
  int count2 = 0;
  int count3 = 0;
  int count4 = 0;
  int count5 = 0;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    // Initialize a timer to update counts every second
    _timer = Timer.periodic(const Duration(seconds: 100), (timer) {
      incrementAll();
    });
  }

  void increment1() {
    count1++;
    update(); // Notify GetBuilder widgets
  }

  void increment2() {
    count2++;
    update();
  }

  void increment3() {
    count3++;
    update();
  }

  void increment4() {
    count4++;
    update();
  }

  void increment5() {
    count5++;
    update();
  }

  void incrementAll() {
    count1++;
    count2++;
    count3++;
    count4++;
    count5++;
    update();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
