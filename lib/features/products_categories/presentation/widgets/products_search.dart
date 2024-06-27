import 'package:flutter/material.dart';
import 'package:test_corner_products/features/products_categories/presentation/widgets/search_text_input.dart';

class ProductsSearch extends StatelessWidget {
  const ProductsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return SearchTextInput(hintText: "search on categories", controller: controller);
  }
}
