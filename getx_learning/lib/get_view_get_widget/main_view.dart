import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_learning/routes.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main view"),
      ),
      body: Center(
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.getView);
              },
              child: const Text("Get.toNamed GetViewPage"),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.getWidget);
              },
              child: const Text("Get.toNamed GetWidget page"),
            ),
          ],
        ),
      ),
    );
  }
}
