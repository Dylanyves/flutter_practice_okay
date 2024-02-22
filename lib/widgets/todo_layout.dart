import 'package:flutter/material.dart';
import '../pages/todo_page.dart';
import '../models/todo_model.dart';

class TodoLayout extends StatefulWidget {
  TodoLayout({Key? key, required this.todos, required this.deleteTodo})
      : super(key: key);

  final List<Todo> todos;
  ValueChanged<Todo> deleteTodo;

  @override
  State<TodoLayout> createState() => _TodoLayoutState();
}

class _TodoLayoutState extends State<TodoLayout> {
  void navigate(Todo todo) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TodoDisplay(todo: todo)));
  }

  void pressDelete(Todo todo) {
    widget.deleteTodo(todo);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.todos.isEmpty) {
      return const Center(child: Text('No todos yet.'));
    } else {
      return Expanded(
          child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(widget.todos.length, (index) {
          var todo = widget.todos[index];
          return InkWell(
            onTap: () => navigate(todo),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 200,
                  height: 200,
                  color: todo.importance == 1
                      ? Colors.red
                      : todo.importance == 2
                          ? Colors.yellow
                          : Colors.green,
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Text(todo.todo),
                        IconButton(
                            onPressed: () => pressDelete(todo),
                            icon: Icon(Icons.delete))
                      ]))),
            ),
          );
        }),
      ));
    }
  }
}
