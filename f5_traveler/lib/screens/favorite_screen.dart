import 'package:f5_traveler/components/place_item.dart';
import 'package:f5_traveler/models/place.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  List<Place> favoritePlaces;

  FavoriteScreen(this.favoritePlaces);

  @override
  Widget build(BuildContext context) {
    if (favoritePlaces.isEmpty) {
      return const Center(
        child: Text('Nenhum Lugar Marcado como Favorito!'),
      );
    } else {
      return ListView.builder(
          itemCount: favoritePlaces.length,
          itemBuilder: (ctx, index) {
            return PlaceItem(favoritePlaces[index]);
          });
    }
  }
}
