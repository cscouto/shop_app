import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem _item;
  final Key key;

  CartItemWidget(this.key, this._item) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                child: Text('\$${_item.price}'),
              ),
            ),
          ),
          title: Text(_item.title),
          subtitle: Text('Total: \$${_item.price * _item.quantity}'),
          trailing: Text('${_item.quantity} x'),
        ),
        padding: EdgeInsets.all(8),
      ),
    );
  }
}
