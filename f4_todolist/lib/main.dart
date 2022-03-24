import 'dart:math';

import 'package:f4_todolist/components/task_form.dart';
import 'package:f4_todolist/components/task_list.dart';
import 'package:f4_todolist/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';

main() {
  runApp(ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
    return MaterialApp(
      home: MyHomePage(),
      theme: tema.copyWith(
          colorScheme: tema.colorScheme
              .copyWith(primary: Colors.purple, secondary: Colors.amber),
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Helvetica')),
          textTheme: tema.textTheme
              .copyWith(button: TextStyle(fontWeight: FontWeight.bold))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _titleController = TextEditingController();

  final List<Task> _tasks = [
    Task(
      id: 't0',
      title: 'Limpar o quarto',
      date: DateTime.now(),
    ),
    Task(
      id: 't1',
      title: 'Planejar semana',
      date: DateTime.now(),
    ),
    Task(
      id: 't2',
      title: 'Treinar',
      date: DateTime.now().subtract(Duration(days: 2)),
    )
  ];

  _newTask(String title, DateTime date) {
    final newTask =
        Task(id: Random().nextDouble().toString(), title: title, date: date);

    //COM ESTADO
    setState(() {
      _tasks.add(newTask);
    });
    //return print(title);

    //fechando o modal
    Navigator.of(context).pop();
  }

  //Modal
  _openTaskFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TaskForm(_newTask);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        actions: <Widget>[
          IconButton(
              onPressed: () => _openTaskFormModal(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          //TaskForm(_newTask),
          SizedBox(
            height: 20,
          ),
          TaskList(_tasks),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTaskFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
