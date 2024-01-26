import 'package:flutter/material.dart';
import 'package:statemanagement_3b/screens/viewproducts.dart';

void main() {
  runApp(const ActivityApp());
}

class ActivityApp extends StatelessWidget {
  const ActivityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ViewProductsScreen(),
    );
  }
}
