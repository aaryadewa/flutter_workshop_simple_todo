class TodoModel {

  String title;
  String description;
  bool done;

  TodoModel(this.title, this.description, [this.done = false]);

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      json['title'],
      json['description'],
      json['done']
    );
  }
}