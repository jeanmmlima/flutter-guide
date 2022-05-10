import 'package:f6_sm_counter/models/CounterModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda tela do Contador'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Na segunda tela meu contador é: "),
            Consumer<CounterModel>(builder: (context, counter, child) {
              return Text(
                "Contador: ${counter.countValue}",
                style: TextStyle(fontSize: 25),
              );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle),
        onPressed: () {
          final contador = context.read<CounterModel>();
          contador.add();
        },
      ),
    );
  }
}
