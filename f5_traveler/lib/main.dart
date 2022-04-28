import 'dart:ui';

import 'package:f5_traveler/screens/countries_places_screen.dart';
import 'package:flutter/material.dart';

import 'screens/countries_screen.dart';

import 'utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DicasParaViajantes2',
      theme: ThemeData(
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: Colors.purple, secondary: Colors.amber),
          //primarySwatch: Colors.purple,
          //accentColor: Colors.amber,
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ))),
      //home: CountriesScreen(),
      initialRoute: AppRoutes.HOME,
      //rota inicial
      //ROTAS NOMEADAS
      routes: {
        //nome : e função que retorna o widget (screen) a
        //partir da rota declarada
        /* FORMA 1
        '/country-places': (ctx) => CountryPlacesScreen(),
        '/': (ctx) => CountriesScreen(), // vira a rota raiz (home)
        */
        AppRoutes.HOME: (ctx) => CountriesScreen(),
        AppRoutes.COUNTRY_PLACES: (ctx) => CountryPlacesScreen(),
      },
    );
  }
}
