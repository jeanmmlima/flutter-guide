import 'package:f4_todolist/models/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskList extends StatelessWidget {
  final List<Task> _listaTarefas;

  TaskList(this._listaTarefas);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: _listaTarefas.map((task) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    //personalização
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: task.date.day == DateTime.now().day
                            ? Colors.blue
                            : Colors.red,
                      ),
                    ),
                    child: Text(DateFormat('d MMM y').format(task.date),
                        style: task.date.day == DateTime.now().day
                            ? TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              )
                            : TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              )),
                  ),
                  Text(task.title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
