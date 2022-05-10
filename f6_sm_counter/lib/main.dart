import 'package:f6_sm_counter/models/CounterModel.dart';
import 'package:f6_sm_counter/screens/CounterSM.dart';
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
    return MaterialApp(initialRoute: '/', routes: {
      '/': (ctx) => CounterSM(),
      '/second-screen': (ctx) => SecondScreen(),
    });
  }
}
