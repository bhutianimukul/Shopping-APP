import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Providers/products_provider.dart';
import 'package:shop/Screens/edit_product_Screen.dart';

class UserProductItem extends StatelessWidget {
  final title;
  final imageUrl;
  final String id;

  const UserProductItem({this.id, this.title, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(EditProductScreen.routeName, arguments: id);
                }),
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  final providerData =
                      Provider.of<Products>(context, listen: false);
                  providerData.deleteProduct(id);
                }),
          ],
        ),
      ),
    );
  }
}
