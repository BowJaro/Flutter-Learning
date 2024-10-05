import 'package:get/get.dart';
import 'package:getx_learning/obx_getbuilder/controllers/obx_heavy_controller.dart';

class ObxHeavyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MyObxHeavyController(),
      fenix: true,
    );
  }
}
