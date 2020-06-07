import 'package:flutter/material.dart';
import 'package:shop_app/model/product.dart';

class ProductDetailPage extends StatelessWidget {
  static const routeName = 'product-detail';

  @override
  Widget build(BuildContext context) {
    final Product _product = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(_product.title),
      ),
    );
  }
}
