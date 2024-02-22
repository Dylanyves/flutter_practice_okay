import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../models/todo_model.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key, required this.addTodo});

  final ValueChanged<Todo> addTodo;

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _todoController = TextEditingController();
  final _categoryController = TextEditingController();
  final _importanceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  void onSubmit() {
    final todo = _todoController.text;
    final category = _categoryController.text;
    final importance = int.parse(_importanceController.text);

    bool validate = _formKey.currentState!.validate();
    if (!validate) {
      return;
    }

    Todo newTodo = Todo(
        todo: todo,
        category: category,
        importance: importance,
        isFinished: false);

    widget.addTodo(newTodo);
    _todoController.clear();
    _categoryController.clear();
    _importanceController.clear();
  }

  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
                controller: _todoController,
                validator: RequiredValidator(errorText: "Enter todo activity"),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Todo",
                )),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: _categoryController,
                validator: MultiValidator([
                  RequiredValidator(errorText: "Please enter the category"),
                  MinLengthValidator(4,
                      errorText: "Length must be at least 4 letters")
                ]),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Category",
                )),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: _importanceController,
                validator: MultiValidator([
                  RequiredValidator(errorText: "Please enter the importance"),
                  PatternValidator(r'^[123]$', errorText: "Enter 1 or 2 or 3")
                ]),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Importance",
                )),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(onPressed: onSubmit, child: Text("Add Todo"))
          ],
        ));
  }
}
