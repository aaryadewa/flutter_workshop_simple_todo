import 'dart:convert';
import 'dart:io';

import 'package:flutter_workshop_simple_todo/data/model/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoDatasource {

  final _url = 'http://10.0.2.2/todos';

  Future<List<TodoModel>> getTodos() async {
    final response = await http.get(_url);
    List<TodoModel> todos = [];

    if (response.statusCode == HttpStatus.ok) {
      final List<dynamic> json = jsonDecode(response.body);
      todos = json.map((item) => TodoModel.fromJson(item)).toList();
    }

    return todos;
  }

  Future<TodoModel> addTodo(TodoModel todo) async {
    final json = todo.toJson();
    final response = await http.post(_url,
      headers: {
        HttpHeaders.contentTypeHeader: ContentType.json.value
      },
      body: jsonEncode(json)
    );

    if (response.statusCode == HttpStatus.created) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return TodoModel.fromJson(json);
    }

    return todo;
  }
}