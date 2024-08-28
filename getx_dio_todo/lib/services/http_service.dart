import 'package:dio/dio.dart';
import 'package:getx_dio_todo/constants.dart';
import 'package:getx_dio_todo/models/todo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'apikey': apiKey,
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
      'Prefer': 'return=representation',
    },
  ),
);

final supabase = Supabase.instance.client;

Future<List<Todo>> getAllTodoItems() async {
  try {
    final response = await dio.get('/ToDo?select=*');
    if (response.statusCode == 200) {
      final result =
          (response.data as List).map((item) => Todo.fromJson(item)).toList();
      return result;
    } else {
      throw Exception(
          'Failed to fetch all to-do items: ${response.statusCode}');
    }
  } on DioException catch (e) {
    throw Exception('Error fetching all to-do items: ${e.message}');
  }
}

Future<bool> addTodoItem(Todo todo) async {
  try {
    await dio.post('/ToDo', data: todo.toJson());

    return true;
  } on DioException catch (e) {
    throw Exception('Error adding to-do item: ${e.message}');
  } catch (e) {
    return false;
  }
}

Future<bool> updateTodoItem(Todo todo) async {
  try {
    print("This is data ${todo.toJson()}");

    await dio.patch('/ToDo?id=eq.${todo.id}', data: todo.toJson());
    return true;
  } on DioException catch (e) {
    print("This is Error: $e");
    throw Exception('Error updating to-do item: ${e.message}');
  } catch (e) {
    print("This is error $e");
    return false;
  }
}

Future<bool> deleteTodoItem(int id) async {
  try {
    print("This is id $id");

    await dio.delete('/ToDo?id=eq.$id');
    return true;
  } on DioException catch (e) {
    print("This is Error: $e");
    throw Exception('Error updating to-do item: ${e.message}');
  } catch (e) {
    print("This is error $e");
    return false;
  }
}
