import 'package:f6_sm_counter/models/CounterModel.dart';
import 'package:f6_sm_counter/screens/SecondScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: ((context) => CounterModel()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterSM(),
      
    );
  }
}

class CounterSM extends StatelessWidget {
  _showSecondScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return SecondScreen();
    }));
  }

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
              onPressed: _showSecondScreen(context),
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
