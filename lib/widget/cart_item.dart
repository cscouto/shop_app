import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem _item;
  final Key key;
  final Function callback;

  CartItemWidget(this.key, this._item, this.callback) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key,
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you wnat to remove item from the cart?'),
            actions: <Widget>[
              FlatButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
              ),
              FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
              )
            ],
          ),
        );
      },
      onDismissed: callback,
      child: Card(
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
      ),
    );
  }
}
