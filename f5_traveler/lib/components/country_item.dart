import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../screens/countries_places_screen.dart';

import '../models/country.dart';

class CountryItem extends StatelessWidget {
  final Country country;

  const CountryItem(this.country);

  void _selectCountry(BuildContext context) {
    //usar o navigator para fazer o push
    //colocar mais uma tela na nossa pilha de telas
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return CountryPlacesScreen(country);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //tornando elemento clicável
      onTap: () => _selectCountry(context),
      splashColor: Theme.of(context).primaryColor, //cor do clique
      borderRadius: BorderRadius.circular(15), //clique dentro da área esperada
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          country.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [
                  country.color.withOpacity(0.5), //cor passad com opacidade
                  country.color, //cor passada
                ],
                begin: Alignment.topLeft, //inicio do gradiente
                end: Alignment.bottomRight // fim
                )),
      ),
    );
  }
}
