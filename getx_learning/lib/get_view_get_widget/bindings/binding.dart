import 'package:get/get.dart';
import 'package:getx_learning/get_view_get_widget/controllers/controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(
    //   () => MyController(),
    //   fenix: true,
    // );
    // Get.lazyPut(
    //   () => MyController(),
    //   fenix: false,
    // );
    // Get.put(MyController());
    Get.create(() => MyController());
  }
}
