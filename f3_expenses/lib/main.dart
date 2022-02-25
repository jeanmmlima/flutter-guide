import 'package:f3_expenses/components/transaction_form.dart';
import 'package:f3_expenses/components/transaction_list.dart';
import 'package:f3_expenses/components/transaction_user.dart';
import 'package:f3_expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Despesas Pessoais')),
        body: SingleChildScrollView(
          //torna a tela scrollable componente pai
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Card(
                    color: Colors.blue,
                    child: Text('Gráfico'),
                    elevation: 5,
                  ),
                ),
                TransactionUser()
              ]),
        ));
  }
}
