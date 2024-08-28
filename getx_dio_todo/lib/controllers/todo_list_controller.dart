import 'package:get/get.dart';
import 'package:getx_dio_todo/models/todo.dart';
import 'package:getx_dio_todo/services/http_service.dart';

class TodoListController extends GetxController {
  var loading = true.obs;
  var todoList = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    loading.value = true;

    getAllTodoItems().then((value) {
      todoList.addAll(value);
      loading.value = false;
    });
  }

  void changeStatus(int index) {
    bool currentStatus = todoList[index].status;
    Todo updatedTodo = todoList[index].copyWith(status: !currentStatus);
    todoList[index] = updatedTodo;
    updateTodo(updatedTodo);
  }

  Future<bool> addTodo(Todo todo) async {
    var result = await addTodoItem(todo);
    if (result) {
      todoList.add(todo);
    }
    return result;
  }

  Future<bool> updateTodo(Todo todo) async {
    var result = await updateTodoItem(todo);
    if (result) {
      final index = todoList.indexWhere((element) => element.id == todo.id);
      if (index != -1) {
        todoList[index] = todo;
        return true;
      }
    }
    return false;
  }

  Future<bool> deleteTodo(int index) async {
    int id = todoList[index].id ?? 0;
    var result = await deleteTodoItem(id);
    if (result) {
      todoList.removeAt(index);
      return true;
    }
    return false;
  }
}
