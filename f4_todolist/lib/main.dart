import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() {
  runApp(ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
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
                        decoration: InputDecoration(labelText: 'Task'),
                      ),
                      TextButton(
                        onPressed: () {},
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
