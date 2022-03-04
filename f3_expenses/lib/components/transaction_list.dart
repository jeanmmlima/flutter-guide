import 'package:f3_expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions) {}

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        //child: SingleChildScrollView(//precisa de um componente pai com tamanho fixo (Container)
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Nenhuma transação cadastrada!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                //precisa de um componente pai com tamanho fixo (Container)
                /**
         * Vai chamando componentes de acordo com a necessidade de listá-los
         * Melhora a performace! Image uma lista de 10 mil itens sendo carregados -> crash
         * Dessa forma, só carrega quando for necessário / estiver dentro da visualização
         * A cada scroll novos elementos são renderizados
         */
                itemCount: transactions.length,
                itemBuilder: (ctx, index) {
                  final tr = transactions[index];
                  return Card(
                    child: Row(children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        )),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          //'R\$ ' + tr.value.toString(),
                          'R\$ ${tr.value.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(tr.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6 //pegando o tema
                              /*
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          */
                              ),
                          Text(
                            DateFormat('d MMM y').format(tr.date),
                            //tr.date.toString(),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ]),
                  );
                },
                /*
        children: transactions.map((tr) {
          /* return Card(
            child: Row(children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.purple,
                  width: 2,
                )),
                padding: EdgeInsets.all(10),
                child: Text(
                  //'R\$ ' + tr.value.toString(),
                  'R\$ ${tr.value.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tr.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat('d MMM y').format(tr.date),
                    //tr.date.toString(),
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ]),
          );
          */
        }).toList(),
      ),
      */
              ));
  }
}
