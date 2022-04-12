import 'package:flutter/material.dart';

import '../models/country.dart';

class CountryPlacesScreen extends StatelessWidget {
  final Country country;

  const CountryPlacesScreen(this.country);
  @override
  Widget build(BuildContext context) {
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
