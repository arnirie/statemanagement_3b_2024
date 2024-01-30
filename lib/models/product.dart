//data class
class Product {
  final String code;
  String nameDesc;
  double price;
  bool isFavorite;

  //constructor
  Product({
    required this.code,
    required this.nameDesc,
    required this.price,
    this.isFavorite = false,
  });
}
