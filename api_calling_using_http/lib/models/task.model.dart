class Task {
  String task;
  String description;
  String date;
  bool isCompleted;

  Task(
      {required this.task,
      required this.description,
      required this.date,
      required this.isCompleted});

  static List<Task> fromlistJson(List<Map<String, dynamic>> jsonList) {
    List<Task> tasksList = [];
    for (var json in jsonList) {
      Task task = Task.fromjson(json);
      tasksList.add(task);
    }
    return tasksList;
  }

  factory Task.fromjson(Map<String, dynamic> json) {
    return Task(
        task: json["Title"],
        description: json["description"],
        date: json["date"],
        isCompleted: json["isCoplted"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "Title": task,
      "description": description,
      "isCoplted": isCompleted,
      "date": date,
    };
  }
}
