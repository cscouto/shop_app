import 'package:flutter/material.dart';
import 'package:shop_app/model/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product _product;

  ProductDetailPage(this._product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_product.title),
      ),
    );
  }
}
