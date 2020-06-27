import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/pages/edit_product_page.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widget/app_drawer.dart';
import 'package:shop_app/widget/user_product_item_widget.dart';

class UserProductsPage extends StatelessWidget {
  static const routeName = '/myproducts';

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductPage.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            final _item = _provider.items[index];
            return Column(
              children: <Widget>[
                UserProductItemWidget(
                  ValueKey(_item.id),
                  _item,
                ),
                Divider(),
              ],
            );
          },
          itemCount: _provider.items.length,
        ),
      ),
    );
  }
}
