import 'package:equatable/equatable.dart';
import 'package:test_corner_products/features/products_categories/products/models/product_model.dart';

class ProductsModel extends Equatable {
  final List<ProductModel>? products;

  const ProductsModel({required this.products});

  factory ProductsModel.fromJson({required Map<String, dynamic> json}) {
    return ProductsModel(
        products: json['products'] != null
            ?
        List.from( (json['products'] as List).map((e) => ProductModel.fromJson(json: e)) )
            :
        []
    );
  }

  @override
  List<Object?> get props => [products];
}
