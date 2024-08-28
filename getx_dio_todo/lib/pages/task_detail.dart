import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio_todo/controllers/todo_list_controller.dart';
import 'package:getx_dio_todo/models/todo.dart';

class TaskDetailPage extends StatelessWidget {
  final Todo? todo; // Passed in from the constructor, null for a new task

  // Use TextEditingController with GetX
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final RxBool _status = false.obs;
  final Rx<DateTime> _time = DateTime.now().obs;

  TaskDetailPage({super.key, this.todo}) {
    if (todo != null) {
      nameController.text = todo!.name;
      contentController.text = todo!.content;
      _status.value = todo!.status;
      _time.value = todo!.time;
    }
  }

  @override
  Widget build(BuildContext context) {
    final todoListController = Get.find<TodoListController>();
    final isEditing = todo != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Task' : 'Add Task'),
        actions: [getSaveButton(isEditing, todoListController)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => Row(
                  children: [
                    Checkbox(
                      value: _status.value,
                      onChanged: (value) {
                        _status.value = value!;
                      },
                    ),
                    const Text('Completed'),
                  ],
                )),
            TextField(
              decoration: const InputDecoration(labelText: 'Task Name'),
              controller: nameController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Task Content'),
              controller: contentController,
            ),
            const SizedBox(height: 20),
            Obx(() => ListTile(
                  title: Text(
                      "Date: ${_time.value.toLocal().toString().split('.').first}"),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () => _selectDateTime(context),
                )),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  IconButton getSaveButton(
      bool isEditing, TodoListController todoListController) {
    return IconButton(
      icon: const Icon(Icons.done),
      onPressed: () {
        if (isEditing) {
          // Edit the existing task
          todo!.name = nameController.text;
          todo!.content = contentController.text;
          todo!.status = _status.value;
          todo!.time = _time.value;

          todoListController.updateTodo(todo!).then((isSuccessful) {
            if (isSuccessful) {
              Get.back();
              showSuccessMessage();
            } else {
              showErrorAlert();
            }
          });
        } else {
          // Add a new task
          Todo newTodo = Todo(
            name: nameController.text,
            content: contentController.text,
            time: _time.value,
            status: _status.value,
          );

          todoListController.addTodo(newTodo).then((isSuccessful) {
            if (isSuccessful) {
              showSuccessMessage();
              nameController.clear();
              contentController.clear();
              _status.value = false;
            } else {
              showErrorAlert();
            }
          });
        }
      },
    );
  }

  // Function to show a date-time picker
  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _time.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      if (context.mounted) {
        final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(_time.value),
        );

        if (pickedTime != null) {
          final DateTime fullPickedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );

          _time.value = fullPickedDateTime;
        }
      }
    }
  }

  void showSuccessMessage() {
    Get.snackbar(
      "Success!",
      "Task ${todo != null ? 'edited' : 'added'} successfully.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void showErrorAlert({String message = "An error occurred."}) {
    Get.dialog(
      AlertDialog(
        title: const Text('Task Operation Failed'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
