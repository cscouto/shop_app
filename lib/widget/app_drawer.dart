import 'package:flutter/material.dart';
import 'package:shop_app/pages/orders_page.dart';
import 'package:shop_app/pages/user_products_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap:() {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap:() {
              Navigator.of(context).pushReplacementNamed(OrdersPage.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap:() {
              Navigator.of(context).pushReplacementNamed(UserProductsPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
