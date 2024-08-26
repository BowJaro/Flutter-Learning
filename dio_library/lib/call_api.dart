import 'package:dio/dio.dart';

final String rootPath = "https://jsonplaceholder.typicode.com";

Future<String> fetchData() async {
  var dio = Dio();
  var response = await dio.get("$rootPath/todos/1");
  print("This is response from fetchData $response");
  return "Successfully fetched";
}

Future<String> postData() async {
  var dio = Dio();
  var data = {"name": "This is name", "email": "theemail@gmail.com"};
  var response = await dio.post("$rootPath/posts", data: data);
  print("This is response from postData $response");
  return "Successfully posted";
}

Future<String> putData() async {
  var dio = Dio();
  var data = {"name": "This is the new name", "email": "theemail@gmail.com"};
  var response = await dio.put("$rootPath/posts/1", data: data);
  print("This is response from putData $response");
  return "Successfully put";
}

Future<String> patchData() async {
  var dio = Dio();
  var data = {"name": "This is new name"};
  var response = await dio.patch("$rootPath/posts/1", data: data);
  print("This is response from patchData $response");
  return "Successfully patched";
}

Future<String> deleteData() async {
  var dio = Dio();
  var response = await dio.delete("$rootPath/posts/1");
  print("This is response from deleteData $response");
  return "Successfully deleted";
}
