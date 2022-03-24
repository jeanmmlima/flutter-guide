import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskForm extends StatefulWidget {
  //1. declarar funcao para comunicacao indireta
  final void Function(String, DateTime) onSubmit;

  TaskForm(this.onSubmit);

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _titleController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;

    //boas práticas de programação
    if (title.isEmpty) {
      return;
    }
    widget.onSubmit(title, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2023))
        .then((pickedDate) {
      //chamada no futuro
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(children: <Widget>[
                Expanded(
                  child: Text(_selectedDate == null
                      ? 'Nenhuma data selecionada'
                      : 'Data selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}'),
                ),
                TextButton(
                    //style: TextButton.styleFrom(primary: Colors.blue),
                    onPressed: _showDatePicker,
                    child: Text(
                      'Selecionar Data',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ]),
            ),
          ),
          ElevatedButton(
            //comentar erro se digitar _newTask()
            onPressed: _submitForm,
            child: Text('Nova Tarefa'),
          )
        ],
      ),
    );
  }
}
