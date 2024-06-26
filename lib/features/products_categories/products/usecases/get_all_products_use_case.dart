
import 'package:equatable/equatable.dart';
import 'package:test_corner_products/core/network/use_cases/base_usecase.dart';
import 'package:test_corner_products/features/products_categories/products/models/products_model.dart';
import 'package:test_corner_products/features/products_categories/products/repository/products_repository.dart';

class GetAllProductsUseCase implements BaseUseCase<ProductsModel, GetAllProductsUseCaseParameters> {
  final ProductsRepository productsRepository;
  GetAllProductsUseCase({required this.productsRepository});

  @override
  Future<ProductsModel> call({required GetAllProductsUseCaseParameters parameters}) {
    return productsRepository.getAllProducts();
  }
}

class GetAllProductsUseCaseParameters extends Equatable {
  @override
  List<Object?> get props => [];
}
