import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop_simple_todo/data/model/todo_model.dart';

class TodoForm extends StatefulWidget {
  @override
  State createState() {
    return _TodoFormState();
  }
}

class _TodoFormState extends State<TodoForm> {

  final _formKey = GlobalKey<FormState>();
  final _titleKey = GlobalKey<FormFieldState>();
  final _descriptionKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            key: _titleKey,
            decoration: InputDecoration(
              hintText: 'Title'
            ),
            validator: (value)
              => value.isEmpty ? 'Please enter the title' : null,
          ),
          TextFormField(
            key: _descriptionKey,
            decoration: InputDecoration(
                hintText: 'Description'
            ),
            validator: (value)
              => value.isEmpty ? 'Please enter the description' : null,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 16.0,
              right: 16.0
            ),
            child: MaterialButton(
              child: Text('Save'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  final todo = TodoModel(
                    title: _titleKey.currentState.value,
                    description: _descriptionKey.currentState.value
                  );

                  Navigator.of(context).pop(todo);
                }
              },
            ),
          )
        ],
      )
    );
  }
}