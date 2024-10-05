import 'package:get/get.dart';
import 'package:getx_learning/obx_getbuilder/controllers/get_builder_controller.dart';

class GetBuilderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MyGetBuilderController(),
      fenix: true,
    );
  }
}
