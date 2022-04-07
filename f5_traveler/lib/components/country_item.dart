import 'package:flutter/material.dart';

import '../models/country.dart';

class CountryItem extends StatelessWidget {
  final Country country;

  const CountryItem(this.country);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(country.title),
    );
  }
}
