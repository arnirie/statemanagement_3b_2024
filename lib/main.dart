import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_3b/providers/productprovider.dart';
import 'package:statemanagement_3b/screens/viewproducts.dart';

void main() {
  runApp(const ActivityApp());
}

class ActivityApp extends StatelessWidget {
  const ActivityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ViewProductsScreen(),
      ),
    );
  }
}
