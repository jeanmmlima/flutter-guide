import 'package:f5_traveler/models/country.dart';
import 'package:flutter/material.dart';

class CountryPlacesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final country = ModalRoute.of(context)!.settings.arguments as Country;
    return Scaffold(
      appBar: AppBar(
        title: Text('Lugares para Conhecer'),
        //teste
        //teste
        //teste
      ),
      body: Center(
        child: Text('País selecionado: '),
      ),
    );
  }
}
