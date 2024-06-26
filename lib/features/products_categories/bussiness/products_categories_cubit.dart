import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_corner_products/features/products_categories/bussiness/products_categories_states.dart';
import 'package:test_corner_products/features/products_categories/categories/usecases/get_all_categories_use_case.dart';
import 'package:test_corner_products/features/products_categories/products/models/product_model.dart';
import 'package:test_corner_products/features/products_categories/products/usecases/get_all_products_use_case.dart';

class ProductsCategoriesCubit extends Cubit<ProductsCategoriesState> {

  final GetAllCategoriesUseCase getAllCategoriesUseCase;
  final GetAllProductsUseCase getAllProductsUseCase;

  ProductsCategoriesCubit({required this.getAllCategoriesUseCase, required this.getAllProductsUseCase})
      : super(InitialProductsCategoriesState());

  static ProductsCategoriesCubit get(context) => BlocProvider.of(context);

  bool _isCategoriesOptionSelected = false;

  bool isCategoriesOptionSelected() => _isCategoriesOptionSelected;

  void changeOptionSelectedState() {
    _isCategoriesOptionSelected = !isCategoriesOptionSelected();
    emit(ChangeOptionSelectedState(
        isCategoriesOptionSelected: _isCategoriesOptionSelected));
  }

  List<String> _categories = [];
  List<String> getCategories () => _categories;

  Future<void> getAllCategories() async {
    emit(const GetAllCategoriesState(categories: [], isLoaded: false));
    if(_categories.isEmpty){
      var categoriesModel = await getAllCategoriesUseCase(parameters: GetAllCategoriesUseCaseParameters());
      emit(GetAllCategoriesState(categories: categoriesModel.categories ?? [], isLoaded: true));
      _categories = categoriesModel.categories ?? [];
    }else{
      emit(GetAllCategoriesState(categories: _categories, isLoaded: true));
    }
  }


  List<ProductModel> _products = [];
  List<ProductModel> getProducts () => _products;

  Future<void> getAllProducts() async {
    emit(const GetAllProductsState(products: [], isLoaded: false));
    if(_products.isEmpty){
      var productsModel = await getAllProductsUseCase(parameters: GetAllProductsUseCaseParameters());
      emit(GetAllProductsState(products: productsModel.products ?? [], isLoaded: true));
      _products = productsModel.products ?? [];
    }else{
      emit(GetAllProductsState(products: _products, isLoaded: true));
    }
  }



}