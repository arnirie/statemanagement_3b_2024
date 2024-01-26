import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:statemanagement_3b/models/product.dart';

class ManageProductScreen extends StatefulWidget {
  ManageProductScreen(
      {super.key, this.addProduct, this.editProduct, this.product, this.index});

  final Function(Product p)? addProduct;
  final Function(Product p, int index)? editProduct;
  Product? product;
  final int? index;

  @override
  State<ManageProductScreen> createState() => _ManageProductScreenState();
}

class _ManageProductScreenState extends State<ManageProductScreen> {
  var codeController = TextEditingController();

  var nameController = TextEditingController();

  var priceController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.product != null) {
      codeController.text = widget.product!.code;
      nameController.text = widget.product!.nameDesc;
      priceController.text = widget.product!.price.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? 'Add Product' : 'Edit Product'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            TextField(
              controller: codeController,
              readOnly: widget.product != null,
              decoration: InputDecoration(
                label: Text('Code'),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                label: Text('Name/Description'),
                border: OutlineInputBorder(),
              ),
            ),
            Gap(8),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                label: Text('Price'),
                border: OutlineInputBorder(),
              ),
            ),
            Gap(8),
            ElevatedButton(
              onPressed: () {
                var product = Product(
                  code: codeController.text,
                  nameDesc: nameController.text,
                  price: double.parse(priceController.text),
                );
                if (widget.product == null) {
                  widget.addProduct!(product);
                } else {
                  widget.editProduct!(product, widget.index!);
                }
                Navigator.of(context).pop();
              },
              child: Text(widget.product == null ? 'ADD' : 'EDIT'),
            ),
          ],
        ),
      ),
    );
  }
}
