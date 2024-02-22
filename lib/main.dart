import 'package:flutter/material.dart';
import '../widgets/form_widget.dart';
import '../widgets/todo_layout.dart';
import '../models/todo_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Main App",
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Main App"),
          ),
          body: Home(),
        ));
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Todo todo1 = Todo(
      todo: "Learn Flutter",
      importance: 1,
      category: "study",
      isFinished: false);
  Todo todo2 = Todo(
      todo: "Prepare for mathematic exam",
      importance: 2,
      category: "study",
      isFinished: false);
  Todo todo3 = Todo(
      todo: "Pay rent and bills to landlord",
      importance: 3,
      category: "bill",
      isFinished: false);

  List<Todo> _todos = [];

  _addTodo(Todo newTodo) {
    setState(() {
      _todos.add(newTodo);
    });
  }

  _deleteTodo(Todo todo) {
    setState(() {
      _todos.remove(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          FormWidget(
            addTodo: _addTodo,
          ),
          SizedBox(
            height: 50,
          ),
          TodoLayout(todos: _todos, deleteTodo: _deleteTodo),
        ],
      ),
    );
  }
}
