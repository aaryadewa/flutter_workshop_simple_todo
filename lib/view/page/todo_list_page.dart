import 'package:flutter/material.dart';
import 'package:flutter_workshop_simple_todo/data/datasource/todo_datasource.dart';
import 'package:flutter_workshop_simple_todo/data/model/todo_model.dart';
import 'package:flutter_workshop_simple_todo/view/widget/todo_form.dart';

class TodoListPage extends StatefulWidget {

  final TodoDatasource _datasource;

  TodoListPage({
    Key key,
    @required TodoDatasource datasource
  })
    : _datasource = datasource,
      super(key: key);

  @override
  State createState() => TodoListPageState(datasource: _datasource);
}

class TodoListPageState extends State<TodoListPage> {

  final TodoDatasource _datasource;
  List<TodoModel> _todos = [];
  bool _isLoading = false;

  final _appBar = AppBar(
    title: const Text('Todo List'),
  );

  TodoListPageState({
    @required TodoDatasource datasource
  }) : _datasource = datasource;

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

  Future<void> _newTodo(BuildContext context) async {
    final todo = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Add Todo'),
          children: <Widget>[
            Padding(
              child: TodoForm(),
              padding: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
            )
          ],
        );
      }
    );

    if (todo != null) {
      setState(() {
        _isLoading = true;
      });

      final savedTodo = await _datasource.addTodo(todo);

      if (savedTodo.id > 0) {
        setState(() {
          _todos.add(savedTodo);
          _isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    _isLoading = true;
    _datasource.getTodos().then((todos) {
      setState(() {
        _todos = todos;
        _isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Stack(
        children: <Widget>[
          _buildListView(_todos),
          _isLoading ? LinearProgressIndicator() : Container()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async => await _newTodo(context),
        tooltip: 'Add',
      )
    );
  }
}