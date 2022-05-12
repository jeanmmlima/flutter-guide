import 'package:f7_provider_shopper/models/catalogo.dart';
import 'package:flutter/foundation.dart';

class CartModel extends ChangeNotifier {
  late CatalogModel _catalog;

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;

    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  int get totalPrice =>
      items.fold(0, (total, itemCorrente) => total + itemCorrente.price);

  void add(Item item) {
    _itemIds.add(item.id);

    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);

    notifyListeners();
  }
}
