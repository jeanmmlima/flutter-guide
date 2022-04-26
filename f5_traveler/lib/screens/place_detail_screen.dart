import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Refeição'),
      ),
      body: Center(
        child: Text('Detalhes da refeição!'),
      ),
    );
  }
}
