import 'dart:io';
import 'dart:math';

import 'package:f10_camera_and_localization/models/place.dart';
import 'package:flutter/material.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
        id: Random().nextDouble().toString(),
        title: title,
        location: null,
        image: image);

    _items.add(newPlace);
    notifyListeners();
  }
}
