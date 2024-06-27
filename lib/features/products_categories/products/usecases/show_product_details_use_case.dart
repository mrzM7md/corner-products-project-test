import 'package:equatable/equatable.dart';
import 'package:test_corner_products/core/network/use_cases/base_usecase.dart';
import 'package:test_corner_products/features/products_categories/products/models/product_model.dart';

class ShowProductDetailsUseCase implements BaseUseCase<ProductModel, ShowProductDetailsUseCaseParameters>{
  @override
  ProductModel call({required ShowProductDetailsUseCaseParameters parameters}) {
    return parameters.product;
  }

}

class ShowProductDetailsUseCaseParameters extends Equatable {
  final ProductModel product;
  const ShowProductDetailsUseCaseParameters({required this.product});

  @override
  List<Object?> get props => [];
}