import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() {
  runApp(ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  _newTask() {
    final title = _titleController.text;

    //boas práticas de programação
    if (title.isEmpty) {
      return;
    }
    return print(title);
  }

  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //home: Text('Olá Flutter do Meu App'),
        home: Scaffold(
            appBar: AppBar(
              title: Text('To Do List!'),
            ),
            body: Column(
              children: [
                Container(
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
                        onPressed: _newTask,
                        child: Text('Nova Tarefa'),
                      )
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text('Item 1'),
                    Text('Item 2'),
                    Text('Item 3'),
                  ],
                )
              ],
            )));
  }
}
