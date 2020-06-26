import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/providers/orders.dart';

class OrderWidget extends StatelessWidget {
  final OrderItem _item;
  final Key key;

  OrderWidget(this.key, this._item) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${_item.amount}'),
            subtitle: Text(DateFormat('dd MM yyyy hh:mm').format(_item.time)),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: (){},
            ),
          )
        ],
      ),
    );
  }
}
