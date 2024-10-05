import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_learning/get_view_get_widget/controllers/controller.dart';
import 'package:getx_learning/get_view_get_widget/pages/empty_page.dart';

class GetWidgetPage extends GetWidget<MyController> {
  const GetWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Build GetWidget page");
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetWidget page"),
      ),
      body: Center(
        child: Column(
          children: [
            Obx(
              () => Text(
                controller.count.toString(),
              ),
            ),
            IconButton(
              onPressed: () => controller.increment(),
              icon: const Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: () => controller.updateUI(),
              child: const Text("Update UI"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Get.to(() => const EmptyPage()),
              child: const Text("Go to Empty Page"),
            )
          ],
        ),
      ),
    );
  }
}
