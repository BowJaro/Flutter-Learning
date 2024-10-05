import 'package:get/get.dart';
import 'package:getx_learning/obx_getbuilder/controllers/get_builder_heavy_controller.dart';

class GetBuilderHeavyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MyGetBuilderHeavyController(),
      fenix: true,
    );
  }
}
