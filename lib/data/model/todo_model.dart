import 'package:meta/meta.dart';

class TodoModel {

  int id;
  int userId;
  String title;
  String description;
  bool done;

  TodoModel({
    this.id,
    this.userId,
    @required this.title,
    @required this.description,
    this.done = false
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      description: json['description'],
      done: json['done']
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        json[key] = value;
      }
    }

    writeNotNull('id', id);
    writeNotNull('userId', userId);
    json['title'] = title;
    json['description'] = description;
    json['done'] = done;

    return json;
  }

  @override
  String toString() {
    return '{'
        'id: $id,'
        'userId: $userId,'
        'title: $title,'
        'description: $description,'
        'done: $done'
      '}';
  }
}