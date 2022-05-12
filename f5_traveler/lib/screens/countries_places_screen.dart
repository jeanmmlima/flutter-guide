
import 'package:f5_traveler/components/place_item.dart';
import 'package:flutter/foundation.dart';
import 'package:f5_traveler/models/country.dart';
import 'package:flutter/material.dart';
import '../data/my_data.dart';

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

    final countryPlaces = DUMMY_PLACES.where((places) {
      return places.paises.contains(country.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(country.title),
      ),
      body: ListView.builder(
          itemCount: countryPlaces.length,
          itemBuilder: (ctx, index) {
            return PlaceItem(countryPlaces[index]);
          }),
    /*
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
      ), */
    );
  }
}
