class Todo {
  int id;
  String todo;
  int userId;
  bool completed;

  Todo(
      {required this.id,
      required this.userId,
      required this.todo,
      required this.completed});

  static List<Todo> fromlistJson(var jsonList) {
    List<Todo> todosList = [];
    for (var json in jsonList) {
      Todo todo = Todo.fromjson(json);
      todosList.add(todo);
    }
    return todosList;
  }

  factory Todo.fromjson(Map<String, dynamic> json) {
    return Todo(
        id: json["id"],
        todo: json["todo"],
        userId: json["userId"],
        completed: json["completed"]);
  }
}
