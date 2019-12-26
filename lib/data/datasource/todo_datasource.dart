import 'dart:convert';
import 'dart:io';

import 'package:flutter_workshop_simple_todo/data/model/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoDatasource {

  Future<List<TodoModel>> getTodos() async {
    final url = 'http://10.0.2.2/todos';
    final response = await http.get(url);
    List<TodoModel> _todos = [];

    if (response.statusCode == HttpStatus.ok) {
      final List<dynamic> json = jsonDecode(response.body);
      _todos = json.map((item) => TodoModel.fromJson(item)).toList();
    }

    return Future.delayed(Duration(seconds: 2), () => _todos);
  }
}