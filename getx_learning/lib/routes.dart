import 'package:get/get.dart';
import 'package:getx_learning/get_view_get_widget/bindings/binding.dart';
import 'package:getx_learning/get_view_get_widget/pages/get_widget_page.dart';
import 'package:getx_learning/obx_getbuilder/bindings/get_builder_binding.dart';
import 'package:getx_learning/obx_getbuilder/bindings/get_builder_heavy_binding.dart';
import 'package:getx_learning/obx_getbuilder/bindings/obx_binding.dart';
import 'package:getx_learning/obx_getbuilder/bindings/obx_heavy_binding.dart';
import 'package:getx_learning/obx_getbuilder/pages/get_builder_heavy_page.dart';
import 'package:getx_learning/obx_getbuilder/pages/get_builder_page.dart';
import 'package:getx_learning/obx_getbuilder/pages/obx_heavy_page.dart';
import 'package:getx_learning/obx_getbuilder/pages/obx_page.dart';

import 'get_view_get_widget/pages/get_view_page.dart';

abstract class Routes {
  static const String getBuilder = '/';
  static const String obx = "/obx";
  static const String getBuilderHeavy = "/get_builder_heavy";
  static const String obxHeavy = "/obx_heavy";
  static const String getView = "/get_view";
  static const String getWidget = "/get_widget";
}

class AppPages {
  static const initial = Routes.getBuilder;
  static final routes = [
    GetPage(
      name: Routes.getBuilder,
      page: () => const MyGetBuilderPage(),
      binding: GetBuilderBinding(),
    ),
    GetPage(
      name: Routes.obx,
      page: () => const MyObxPage(),
      binding: ObxBinding(),
    ),
    GetPage(
      name: Routes.getBuilderHeavy,
      page: () => const GetBuilderHeavyPage(),
      binding: GetBuilderHeavyBinding(),
    ),
    GetPage(
      name: Routes.obxHeavy,
      page: () => const ObxHeavyPage(),
      binding: ObxHeavyBinding(),
    ),
    GetPage(
      name: Routes.getView,
      page: () => const GetViewPage(),
      binding: MyBinding(),
    ),
    GetPage(
      name: Routes.getWidget,
      page: () => const GetWidgetPage(),
      binding: MyBinding(),
    ),
  ];
}
