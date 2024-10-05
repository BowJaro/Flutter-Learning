import 'package:get/get.dart';
import 'package:getx_learning/obx_getbuilder/controllers/obx_controller.dart';

class ObxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MyObxController(),
      fenix: true,
    );
  }
}
