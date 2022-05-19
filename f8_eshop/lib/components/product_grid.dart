import 'package:f8_eshop/components/product_item.dart';
import 'package:f8_eshop/model/product.dart';
import 'package:f8_eshop/model/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  final _showOnlyFavorites;
  ProductGrid(this._showOnlyFavorites);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);

    final List<Product> loadedProducts =
        _showOnlyFavorites == true ? provider.favoriteItems : provider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      //# ProductItem vai receber a partir do Provider
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loadedProducts[i],
        //child: ProductItem(product: loadedProducts[i]),
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //2 produtos por linha
        childAspectRatio: 3 / 2, //diemnsao de cada elemento
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
