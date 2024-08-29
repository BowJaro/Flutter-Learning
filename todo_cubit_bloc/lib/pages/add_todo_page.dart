import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_bloc/cubit/todo_cubit.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});
  var _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add to-do"),
        centerTitle: true,
      ),
      body: TextFormField(
        controller: _nameController,
        decoration: const InputDecoration(hintText: "Title"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<TodoCubit>(context)
                .addTodo(_nameController.text.trim());
            Navigator.pop(context);
          },
          child: const Icon(Icons.add)),
    );
  }
}
