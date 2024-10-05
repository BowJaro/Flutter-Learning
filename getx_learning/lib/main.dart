import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_learning/get_view_get_widget/main_view.dart';
import 'package:getx_learning/obx_getbuilder/bindings/get_builder_binding.dart';
import 'package:getx_learning/obx_getbuilder/bindings/get_builder_heavy_binding.dart';
import 'package:getx_learning/obx_getbuilder/bindings/obx_binding.dart';
import 'package:getx_learning/obx_getbuilder/bindings/obx_heavy_binding.dart';
import 'package:getx_learning/obx_getbuilder/pages/get_builder_heavy_page.dart';
import 'package:getx_learning/obx_getbuilder/pages/get_builder_page.dart';
import 'package:getx_learning/obx_getbuilder/pages/obx_heavy_page.dart';
import 'package:getx_learning/obx_getbuilder/pages/obx_page.dart';
import 'package:getx_learning/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => NavigationController(), fenix: true);
    GetBuilderBinding().dependencies();
    return GetMaterialApp(
      title: 'GetX State Management Comparison',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavView(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}

class NavigationController extends GetxController {
  var currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        GetBuilderBinding().dependencies();
        break;
      case 1:
        ObxBinding().dependencies();
        break;
      case 2:
        GetBuilderHeavyBinding().dependencies();
        break;
      case 3:
        ObxHeavyBinding().dependencies();
        break;
      default:
        break;
    }
  }
}

// ignore: must_be_immutable
class BottomNavView extends GetView<NavigationController> {
  BottomNavView({super.key});

  List<Widget> pages = const [
    MyGetBuilderPage(),
    MyObxPage(),
    GetBuilderHeavyPage(),
    ObxHeavyPage(),
    MainView(),
  ];

  // List of bottom navigation items
  List<BottomNavigationBarItem> navItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.build),
      label: 'GetBuilder',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.dynamic_feed),
      label: 'Obx',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.build_circle),
      label: 'GetBuilder Heavy',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.dynamic_feed_rounded),
      label: 'Obx Heavy',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.compare),
      label: 'GetView-GetWidget',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages.elementAt(controller.currentIndex.value)),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: navItems,
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: (index) {
            controller.changeIndex(index);
          },
        ),
      ),
    );
  }
}
