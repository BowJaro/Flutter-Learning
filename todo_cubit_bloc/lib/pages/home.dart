import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_bloc/cubit/todo_cubit.dart';
import 'package:todo_cubit_bloc/models/todo.dart';
import 'package:todo_cubit_bloc/pages/add_todo_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo list with Cubit"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<TodoCubit, List<Todo>>(
          builder: (context, todoList) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(todoList[index].name),
                    Text(todoList[index].createdAt.toString().split('.').first)
                  ],
                );
              },
              itemCount: todoList.length,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTodoPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
