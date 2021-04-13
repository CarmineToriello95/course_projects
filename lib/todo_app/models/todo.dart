class ToDo {
  String title;
  bool isDone;

  ToDo({this.title, this.isDone = false});

  static List<ToDo> generateTodos() {
    final todos = [];
    for (var i = 0; i <= 5; i++) {
      todos.add(
        ToDo(title: 'ToDo ${i + 1}'),
      );
    }
    return todos;
  }
}
