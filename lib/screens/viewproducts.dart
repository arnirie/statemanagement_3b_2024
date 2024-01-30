import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_3b/models/product.dart';
import 'package:statemanagement_3b/providers/productprovider.dart';
import 'package:statemanagement_3b/screens/manageproduct.dart';

class ViewProductsScreen extends StatelessWidget {
  ViewProductsScreen({super.key});

  void openAddProduct(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ManageProductScreen(),
      ),
    );
  }

  void openEditProduct(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ManageProductScreen(
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
            onPressed: () => openAddProduct(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<Products>(
        builder: (_, provider, child) {
          return ListView.builder(
            itemBuilder: (_, index) {
              return Card(
                child: ListTile(
                  onTap: () => openEditProduct(context, index),
                  leading: IconButton(
                    onPressed: () {
                      //change the isFavorite value
                      provider.toggleFavorite(index);
                    },
                    icon: Icon(
                      provider.items[index].isFavorite
                          ? Icons.favorite
                          : Icons.favorite_outline,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.shopping_cart),
                  ),
                  title: Text(provider.items[index].nameDesc),
                  subtitle: Text(provider.items[index].code),
                ),
              );
            },
            itemCount: provider.totalNoItems,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.shopping_cart_checkout),
      ),
    );
  }
}
