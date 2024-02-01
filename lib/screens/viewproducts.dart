import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_3b/helpers/dbhelper.dart';
import 'package:statemanagement_3b/models/cartitem.dart';
import 'package:statemanagement_3b/models/product.dart';
import 'package:statemanagement_3b/providers/cartprovider.dart';
import 'package:statemanagement_3b/providers/productprovider.dart';
import 'package:statemanagement_3b/screens/manageproduct.dart';
import 'package:statemanagement_3b/screens/viewcart.dart';

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
    DbHelper.openDb();

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
                    onPressed: () {
                      Provider.of<CartItems>(context, listen: false).add(
                        CartItem(
                          code: provider.items[index].code,
                        ),
                      );
                      // print(provider.items[index].code);
                    },
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
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => ViewCartScreen())),
        child: Icon(Icons.shopping_cart_checkout),
      ),
    );
  }
}
