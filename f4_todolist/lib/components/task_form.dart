import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  //1. declarar funcao para comunicacao indireta
  final void Function(String) onSubmit;

  TaskForm(this.onSubmit);

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _titleController = TextEditingController();

  _submitForm() {
    final title = _titleController.text;

    //boas práticas de programação
    if (title.isEmpty) {
      return;
    }
    widget.onSubmit(title);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Task'),
          ),
          TextButton(
            //comentar erro se digitar _newTask()
            onPressed: _submitForm,
            child: Text('Nova Tarefa'),
          )
        ],
      ),
    );
  }
}
