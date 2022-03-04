import './components/transaction_form.dart';
import './components/transaction_list.dart';
import './components/transaction_user.dart';
import 'package:f3_expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'dart:math';

main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
    return MaterialApp(
        home: MyHomePage(),
        /* definindo TEMA - DEPRECATED
      theme: ThemeData(
          //primaryColor recebe uma UNICA cor primarySwatch recebe um MaterialColor (range de cores)
          primarySwatch: Colors.purple,
          accentColor: Colors.amber), */
        theme: tema.copyWith(
            colorScheme: tema.colorScheme
                .copyWith(primary: Colors.purple, secondary: Colors.amber),
            textTheme: tema.textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'QuickSand',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //transações que ficavam em transaction_user
  final List<Transaction> _transactions = [
    // Transaction(
    //     id: 't1',
    //     title: 'Novo Tenis de Corrida',
    //     value: 310.76,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: 'Conta de Luz', value: 211.30, date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    //fechando o modal
    Navigator.of(context).pop();
  }

  //Modal
  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
              onPressed: () => _openTransactionFormModal(context),
              icon: Icon(Icons.add))
        ],
      ),
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
              //TransactionUser()
              Column(
                children: <Widget>[
                  // TransactionForm(_addTransaction),
                  TransactionList(_transactions),
                ],
              ),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
