import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/widget/app_drawer.dart';
import 'package:shop_app/widget/order_widget.dart';

class OrdersPage extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(itemBuilder: (ctx, index){
        final _item = _provider.orders[index];
        return OrderWidget(ValueKey(_item.id), _item);
      }, itemCount: _provider.orders.length,),
    );
  }
}
