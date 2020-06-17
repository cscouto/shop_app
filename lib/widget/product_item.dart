import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/product.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/widget/product_detail_page.dart';

class ProductItem extends StatelessWidget {
  final Key key;

  ProductItem(this.key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _product = Provider.of<Product>(context, listen: false);
    //listen is false when I'm not interested in perform changes on the ui, so I don't care about the cart changes
    final _cart = Provider.of<Cart>(context, listen: false); 

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailPage.routeName,
              arguments: _product,
            );
          },
          child: Image.network(
            _product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, _product, child) => IconButton(
              icon: Icon(
                  _product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).accentColor,
              onPressed: () {
                _product.toggleFavoriteStatus();
              },
            ),
          ),
          title: Text(
            _product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {
              _cart.add(_product.id, _product.price, _product.title);
            },
          ),
        ),
      ),
    );
  }
}
