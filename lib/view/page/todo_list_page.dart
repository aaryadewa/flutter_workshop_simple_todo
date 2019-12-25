import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop_simple_todo/data/model/todo_model.dart';

class TodoListPage extends StatefulWidget {

  @override
  State createState() => TodoListPageState();
}

class TodoListPageState extends State<TodoListPage> {

  List<TodoModel> _todos = [
    TodoModel('First Todo', 'Replace stateless with statefull widget'),
    TodoModel('Second Todo', 'Add more todo'),
    TodoModel('Third Todo', 'Demonstrate the completed item', true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];

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
                decoration: todo.done ? TextDecoration.none : TextDecoration.none
              ),
            ),
            subtitle: Text(
              todo.description,
              style: TextStyle(
                decoration: todo.done ? TextDecoration.lineThrough : TextDecoration.none
              ),
            ),
          );
        },
      ),
    );
  }
}