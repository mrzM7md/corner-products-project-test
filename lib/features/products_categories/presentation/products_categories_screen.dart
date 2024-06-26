import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsCategoriesScreen extends StatelessWidget {
  const ProductsCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: SelectionArea(
          child: Scaffold(
            body: Center(child: Text("Categories Products Page"),),
          ),
        ),
    );
  }
}
