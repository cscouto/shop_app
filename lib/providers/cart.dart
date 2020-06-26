import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.price,
    @required this.title,
    @required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmmout {
    return _items.values.fold(
      0,
      (previousValue, element) =>
          previousValue + (element.price * element.quantity),
    );
  }

  void removeItem(String id) {
    _items.removeWhere((key, value) => value.id == id);
    notifyListeners();
  }

  void add(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (value) {
          value.quantity += 1;
          return value;
        },
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeSingleItem() {

  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
