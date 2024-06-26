import 'package:equatable/equatable.dart';
import 'package:test_corner_products/features/products_categories/categories/models/categories_model.dart';

abstract class ProductsCategoriesState {}

class InitialProductsCategoriesState extends Equatable implements ProductsCategoriesState {
  @override
  List<Object?> get props => [];
}

class ChangeOptionSelectedState implements ProductsCategoriesState {
  final bool isCategoriesOptionSelected;
  const ChangeOptionSelectedState({required this.isCategoriesOptionSelected});
}

class GetAllCategoriesState implements ProductsCategoriesState{
  final bool isLoaded;
  final List categories;

  const GetAllCategoriesState({required this.categories, required this.isLoaded});
}


class GetAllProductsState implements ProductsCategoriesState{
  final bool isLoaded;
  final List products;

  const GetAllProductsState({required this.products, required this.isLoaded});
}