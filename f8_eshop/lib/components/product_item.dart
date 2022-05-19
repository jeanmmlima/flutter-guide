import 'package:f8_eshop/model/cart.dart';
import 'package:f8_eshop/model/product.dart';
import 'package:f8_eshop/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  /*
  final Product product;

  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);
  */

  @override
  Widget build(BuildContext context) {
    //PEGANDO CONTEUDO PELO PROVIDER
    //final product = Provider.of<Product>(context);
    final product = Provider.of<Product>(
      context,
      listen: false,
    );
    final cart = Provider.of<Cart>(context, listen: false);
    //final product = context.watch<Product>();

    /*
    var isFavorite =
        context.select<Product, bool>((product) => product.isFavorite);
    */

    return ClipRRect(
      //corta de forma arredondada o elemento de acordo com o BorderRaius
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context)
                .pushNamed(AppRoutes.PRODUCT_DETAIL, arguments: product);
          },
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              onPressed: () {
                //adicionando metodo ao clique do botão
                product.toggleFavorite();
              },
              //icon: Icon(Icons.favorite),
              //pegando icone se for favorito ou não
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              //isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          title: Text(
            product.name,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
              onPressed: () {
                cart.addItem(product);
                print(cart.itemsCount);
              },
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
