import 'package:test_corner_products/features/products_categories/categories/models/categories_model.dart';

abstract class CategoriesRepository {
  Future<CategoriesModel> getAllCategories();
}