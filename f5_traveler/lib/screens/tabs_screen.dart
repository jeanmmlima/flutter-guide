import 'package:f5_traveler/screens/countries_screen.dart';
import 'package:f5_traveler/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bora Viajar?'),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.category), text: 'Categorias'),
            Tab(icon: Icon(Icons.star), text: 'Favoritos'),
          ]),
        ),
        body: TabBarView(children: <Widget>[
          CountriesScreen(),
          FavoriteScreen(),
        ]),
      ),
    );
  }
}
