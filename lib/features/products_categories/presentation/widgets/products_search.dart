import 'package:flutter/material.dart';
import 'package:test_corner_products/features/products_categories/bussiness/products_categories_cubit.dart';
import 'package:test_corner_products/features/products_categories/presentation/widgets/search_text_input.dart';

class ProductsSearch extends StatelessWidget {
  const ProductsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsCategoriesCubit controller = ProductsCategoriesCubit.get(context);
    TextEditingController searchController = TextEditingController();
    return SearchTextInput(
        hintText: "search on products by anything", controller: searchController,
      onChange: (value) => controller.searchOnProducts(keyword: value));
  }
}
