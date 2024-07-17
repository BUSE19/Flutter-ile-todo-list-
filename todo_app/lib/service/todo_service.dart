import 'dart:convert';

import 'package:todo_app/model/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  final String url = "https://dummyjson.com/todos";
  final String addUrl = "https://dummyjson.com/todos/add";

  Future<List<Todo>> getUncompletedTodos() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];
    List<Todo> todos = List.empty(growable: true);

    resp.forEach((element) {
      Todo task = Todo.fromJson(element);

      if (task.completed! == false) {
        todos.add(task);
      }
    });

    return todos;
  }

  Future<List<Todo>> getCompletedTodos() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];
    List<Todo> todos = List.empty(growable: true);

    resp.forEach((element) {
      Todo task = Todo.fromJson(element);

      if (task.completed! == true) {
        todos.add(task);
      }
    });

    return todos;
  }

  Future<String> addTodo(Todo newtodo) async {
    final response = await http.post(
      Uri.parse(addUrl),
      headers: <String, String>{
        "content-type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(newtodo.toJson()),
    );
    print(response.body);
    return response.body;
  }
}
