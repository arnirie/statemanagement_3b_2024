import 'package:flutter/material.dart';
import 'package:statemanagement_3b/models/product.dart';
import 'package:statemanagement_3b/screens/manageproduct.dart';

class ViewProductsScreen extends StatefulWidget {
  ViewProductsScreen({super.key});

  @override
  State<ViewProductsScreen> createState() => _ViewProductsScreenState();
}

class _ViewProductsScreenState extends State<ViewProductsScreen> {
  //list of products
  List<Product> listProducts = [
    Product(
      code: 'AB1',
      nameDesc: 'iPhone 15',
      price: 35000,
    ),
    Product(
      code: 'XR1',
      nameDesc: 'Samsung Galaxy Fold',
      price: 31000,
    ),
  ];

  void addProd(Product p) {
    setState(() {
      listProducts.add(p);
    });

    print(listProducts.length);
  }

  void editProd(Product p, int index) {
    listProducts[index].nameDesc = p.nameDesc;
    listProducts[index].price = p.price;
    setState(() {});
  }

  void openAddProduct() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ManageProductScreen(
          addProduct: addProd,
        ),
      ),
    );
  }

  void openEditProduct(Product p, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ManageProductScreen(
          editProduct: editProd,
          product: p,
          index: index,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Products'),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: openAddProduct,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return Card(
            child: ListTile(
              onTap: () => openEditProduct(listProducts[index], index),
              title: Text(listProducts[index].nameDesc),
              subtitle: Text(listProducts[index].code),
            ),
          );
        },
        itemCount: listProducts.length,
      ),
    );
  }
}
