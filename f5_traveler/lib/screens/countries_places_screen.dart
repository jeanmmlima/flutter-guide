import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/country.dart';

class CountryPlacesScreen extends StatelessWidget {
  //NAO PRECISO DO CONSTRUTOR PARA ROTAS NOMEADAS - 2a parte!
  /*
  final Country country;

  const CountryPlacesScreen(this.country);
  */

  @override
  Widget build(BuildContext context) {
    /*
    MODAL ROUTE para rotas nomeadas - 2a parte
    */

    final country = ModalRoute.of(context)!.settings.arguments as Country;

    return Scaffold(
      appBar: AppBar(
        title: Text(country.title),
      ),
      body: Center(
        child: Text('Lugares por País ${country.id}'),
      ),
    );
  }
}
