import 'package:flutter/material.dart';
import 'package:statemanagement_3b/models/cartitem.dart';
import 'package:statemanagement_3b/providers/productprovider.dart';

class CartItems extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get totalNoItems => _items.length;

  void add(CartItem cartItem) {
    //check if the cartItem is already in the _items
    // bool toAdd = true;
    // int i = 0;
    // for (; i <= _items.length - 1; i++) {
    //   if (cartItem.code == _items[i].code) {
    //     toAdd = false;
    //     break;
    //   }
    // }

    // if (toAdd) {
    //   _items.add(cartItem);
    // } else {
    //   _items[i].quantity++;
    // }
    print('contents of cartItems/items');
    _items.forEach((element) {
      print('${element.code} ${element.quantity}');
    });
    var codeList = _items.map((item) => item.code).toList();
    var index = codeList.indexOf(cartItem.code);
    print(index);
    if (index < 0) {
      _items.add(cartItem);
    } else {
      _items[index].quantity++;
    }

    notifyListeners();
  }
}
