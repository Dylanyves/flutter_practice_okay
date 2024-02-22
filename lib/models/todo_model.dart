class Todo {
  String todo;
  int importance;
  String category;
  bool isFinished;
  String description;

  Todo(
      {required this.todo,
      required this.importance,
      required this.category,
      required this.isFinished,
      this.description = ""});

  void checkTodo() {
    isFinished = !isFinished;
  }
}
