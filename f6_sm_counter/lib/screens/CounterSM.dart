import 'package:f6_sm_counter/models/CounterModel.dart';
import 'package:f6_sm_counter/screens/SecondScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterSM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter MS'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Meu Contador:'),
            Consumer<CounterModel>(
              builder: (context, counter, child) {
                return Text(
                  "Contador: ${counter.countValue}",
                  style: TextStyle(fontSize: 25),
                );
              },
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/second-screen');
              },
              child: Text('Segunda tela'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final contador = context.read<CounterModel>();
          contador.add();
        },
      ),
    );
  }
}
