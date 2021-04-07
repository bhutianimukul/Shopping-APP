// widget to show the  grid tile
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Providers/cart.dart';
import 'package:shop/Providers/product.dart';
import 'package:shop/Screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Cart>(context, listen: false);
    final product = Provider.of<Product>(context, listen: false);
   return Consumer <Product>(
      builder: (context, value, Widget child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GridTile(
            footer: GridTileBar(
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  providerData.addToCart(
                      product.id, product.price, product.title);
                },
              ),
              leading: IconButton(
                icon: Icon(value.isFavorite == false
                    ? Icons.favorite_outline_outlined
                    : Icons.favorite),
                onPressed: () {
                  value.toggleFavorite();
                },
              ),
              backgroundColor: Colors.white60,
              title: Text(
                value.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.body1,
              ),
            ),
            child: InkWell(
                onTap: () => Navigator.pushNamed(
                    context, ProductDetailScreen.routeName,
                    arguments: value.id),
                child: Image.network(
                  value.imageUrl,
                  fit: BoxFit.contain,
                )),
          ),
           );
              }        );
        }
}
