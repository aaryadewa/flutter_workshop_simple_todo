import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('First Todo'),
            subtitle: Text('Short description about first todo'),
          )
        ],
      ),
    );
  }
}