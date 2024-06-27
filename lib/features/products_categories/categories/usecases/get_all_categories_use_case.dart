import 'package:equatable/equatable.dart';
import 'package:test_corner_products/core/network/use_cases/base_usecase.dart';
import 'package:test_corner_products/features/products_categories/categories/models/categories_model.dart';
import 'package:test_corner_products/features/products_categories/categories/repository/categories_repository.dart';

class GetAllCategoriesUseCase implements BaseUseCase<Future<CategoriesModel>, GetAllCategoriesUseCaseParameters> {
  final CategoriesRepository categoriesRepository;
  GetAllCategoriesUseCase({required this.categoriesRepository});

  @override
  Future<CategoriesModel> call({required GetAllCategoriesUseCaseParameters parameters}) {
    return categoriesRepository.getAllCategories();
  }
}

class GetAllCategoriesUseCaseParameters extends Equatable {
  @override
  List<Object?> get props => [];
}
