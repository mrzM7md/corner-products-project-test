import 'package:test_corner_products/features/products_categories/products/models/products_model.dart';

abstract class ProductsRepository {
  Future<ProductsModel> getAllProducts();
}