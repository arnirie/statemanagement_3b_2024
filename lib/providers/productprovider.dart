import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:statemanagement_3b/models/product.dart';

class Products extends ChangeNotifier {
  List<Product> _items = [
    Product(code: '11', nameDesc: '11', price: 11),
    Product(code: '22', nameDesc: '22', price: 22),
  ];

  // List<Product> get items {
  //   return _items;
  // }
  List<Product> get items => _items;

  int get totalNoItems {
    return _items.length;
  }

  void add(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void edit(Product product, int index) {
    _items[index] = product;
    notifyListeners();
  }

  void toggleFavorite(int index) {
    _items[index].isFavorite = !_items[index].isFavorite;
    notifyListeners();
  }

  Product item(int index) => _items[index];
}
