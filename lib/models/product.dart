//data class
import 'package:statemanagement_3b/helpers/dbhelper.dart';

class Product {
  late String code;
  late String nameDesc;
  late double price;
  late bool isFavorite;

  //constructor
  Product({
    required this.code,
    required this.nameDesc,
    required this.price,
    this.isFavorite = false,
  });

  Product.fromMap(Map<String, dynamic> values) {
    code = values[DbHelper.prodCode];
    nameDesc = values[DbHelper.prodName];
    price = double.parse(
      values[DbHelper.prodPrice].toString(),
    );
    isFavorite = false;
  }

  Map<String, dynamic> toMap() {
    return {
      DbHelper.prodCode: code,
      DbHelper.prodName: nameDesc,
      DbHelper.prodPrice: price,
    };
  }
}
