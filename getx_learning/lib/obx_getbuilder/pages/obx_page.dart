import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_learning/obx_getbuilder/controllers/obx_controller.dart';

class MyObxPage extends GetView<MyObxController> {
  const MyObxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Obx Example'),
      ),
      body: Center(
        child: Obx(() => Text(
              'Count: ${controller.count}',
              style: const TextStyle(fontSize: 30),
            )),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: controller.increment,
            heroTag: 'obx_increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: controller.decrement,
            heroTag: 'obx_decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
