import 'package:flutter_workshop_simple_todo/data/model/todo_model.dart';

class TodoDatasource {

  Future<List<TodoModel>> getTodos() async {
    List<TodoModel> _todos = [
      TodoModel('First Todo', 'Replace stateless with statefull widget'),
      TodoModel('Second Todo', 'Add more todo'),
      TodoModel('Third Todo', 'Demonstrate the completed item', true)
    ];

    return Future.delayed(Duration(seconds: 2), () => _todos);
  }
}