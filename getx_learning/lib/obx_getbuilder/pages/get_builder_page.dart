import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_learning/obx_getbuilder/controllers/get_builder_controller.dart';

class MyGetBuilderPage extends GetView<MyGetBuilderController> {
  const MyGetBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetBuilder Example'),
      ),
      body: Center(
        child: GetBuilder<MyGetBuilderController>(
          builder: (_) => Text(
            'Count: ${controller.count}',
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: controller.increment,
            heroTag: 'getbuilder_increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: controller.decrement,
            heroTag: 'getbuilder_decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
