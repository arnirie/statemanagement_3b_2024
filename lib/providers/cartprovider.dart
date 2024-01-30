import 'package:flutter/material.dart';
import 'package:statemanagement_3b/providers/productprovider.dart';

class CartItems extends ChangeNotifier {
  List<Products> _items = [];
}
