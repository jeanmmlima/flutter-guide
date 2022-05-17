import 'package:f8_eshop/components/product_grid.dart';
import 'package:f8_eshop/components/product_item.dart';
import 'package:f8_eshop/data/dummy_data.dart';
import 'package:f8_eshop/model/product.dart';
import 'package:f8_eshop/model/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsOverviewPage extends StatelessWidget {
  ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
      ),
      body: ProductGrid(),
    );
  }
}
