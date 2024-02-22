import 'package:flutter/material.dart';
import '../models/todo_model.dart';

class TodoDisplay extends StatelessWidget {
  TodoDisplay({super.key, required this.todo});

  Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo Display"),
      ),
      body: Center(
        child: Text(todo.todo),
      ),
    );
  }
}
