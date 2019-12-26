import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop_simple_todo/data/model/todo_model.dart';

class TodoListPage extends StatefulWidget {

  @override
  State createState() => TodoListPageState();
}

class TodoListPageState extends State<TodoListPage> {

  final _appBar = AppBar(
    title: Text('Todo List'),
  );

  List<TodoModel> _todos = [
    TodoModel('First Todo', 'Replace stateless with statefull widget'),
    TodoModel('Second Todo', 'Add more todo'),
    TodoModel('Third Todo', 'Demonstrate the completed item', true)
  ];

  TextDecoration _buildTextDecoration(bool isDone) {
    return isDone ? TextDecoration.lineThrough : TextDecoration.none;
  }

  ListView _buildListView(List<TodoModel> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        final textDecoration = _buildTextDecoration(todo.done);

        return ListTile(
          leading: Checkbox(
            value: todo.done,
            onChanged: (newValue) {
              setState(() => todo.done = newValue);
            },
          ),
          title: Text(
            todo.title,
            style: TextStyle(
                decoration: textDecoration
            ),
          ),
          subtitle: Text(
            todo.description,
            style: TextStyle(
                decoration: textDecoration
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _buildListView(_todos)
    );
  }
}