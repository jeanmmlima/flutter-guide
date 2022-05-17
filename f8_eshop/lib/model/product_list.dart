import 'package:f8_eshop/data/dummy_data.dart';
import 'package:f8_eshop/model/product.dart';
import 'package:flutter/cupertino.dart';

class ProductList with ChangeNotifier {
  List<Product> _items = dummyProducts;

  List<Product> get items => _items;

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
