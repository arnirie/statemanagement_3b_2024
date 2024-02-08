import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:statemanagement_3b/helpers/dbhelper.dart';
import 'package:statemanagement_3b/models/product.dart';

class Products extends ChangeNotifier {
  List<Product> _items = [];

  // List<Product> get items {
  //   return _items;
  // }
  Future<List<Product>> get items async {
    var list = await DbHelper.fetchProducts();
    //List<Map<String, dynamic>> -> List<Product>
    return list.map((item) => Product.fromMap(item)).toList();
  }

  // int get totalNoItems {
  //   return _items.length;
  // }

  void add(Product product) async {
    // _items.add(product);
    await DbHelper.insertProduct(product);
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
