import 'package:flutter/material.dart';
import 'package:getx_dio_todo/controllers/todo_list_controller.dart';
import 'package:get/get.dart';
import 'package:getx_dio_todo/pages/task_detail.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  TodoListController todoListController = Get.put(TodoListController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To-do List",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(() => _buildToDoList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => TaskDetailPage()),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildToDoList() {
    if (todoListController.loading.isTrue) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        var todo = todoListController.todoList[index];
        return ListTile(
          leading: Checkbox(
            value: todo.status,
            onChanged: (value) {
              todoListController.changeStatus(index);
            },
          ),
          title: Text(
            todo.name,
            style: const TextStyle(fontSize: 20),
          ),
          subtitle: Text(todo.time.toLocal().toString().split('.').first),
          trailing: _getMoreButton(index),
          onTap: () => Get.to(() => TaskDetailPage(todo: todo)),
        );
      },
      itemCount: todoListController.todoList.length,
    );
  }

  PopupMenuButton<String> _getMoreButton(int index) {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'remove',
            child: Text('Remove'),
          ),
          const PopupMenuItem<String>(
            value: 'reverse',
            child: Text('Reverse check status'),
          ),
          const PopupMenuItem<String>(
            value: 'detail',
            child: Text('Show details'),
          ),
        ];
      },
      onSelected: (String choice) {
        switch (choice) {
          case 'reverse':
            todoListController.changeStatus(index);
            break;
          case 'detail':
            Get.to(() => TaskDetailPage(
                  todo: todoListController.todoList[index],
                ));
            break;
          case 'remove':
            Get.dialog(
              AlertDialog(
                title: const Text('Confirm Removal'),
                content:
                    const Text('Are you sure you want to remove this task?'),
                actions: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      todoListController.deleteTodo(index);
                      Get.back();
                    },
                    child: const Text('Remove'),
                  ),
                ],
              ),
            );
            break;
          default:
        }
      },
      child: const Icon(Icons.more_horiz),
    );
  }
}
