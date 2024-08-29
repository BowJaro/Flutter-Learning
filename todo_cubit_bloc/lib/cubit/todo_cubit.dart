import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_bloc/models/todo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    Todo newTodo = Todo(name: title, createdAt: DateTime.now());
    emit([...state, newTodo]);
  }
}
