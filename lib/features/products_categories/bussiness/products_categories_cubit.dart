import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_corner_products/features/products_categories/bussiness/products_categories_states.dart';
import 'package:test_corner_products/features/products_categories/categories/usecases/get_all_categories_use_case.dart';
import 'package:test_corner_products/features/products_categories/products/models/product_model.dart';
import 'package:test_corner_products/features/products_categories/products/usecases/get_all_products_use_case.dart';
import 'package:test_corner_products/features/products_categories/products/usecases/search_on_products_use_case.dart';
import 'package:test_corner_products/features/products_categories/products/usecases/show_product_details_use_case.dart';

class ProductsCategoriesCubit extends Cubit<ProductsCategoriesState> {

  final GetAllCategoriesUseCase getAllCategoriesUseCase;
  final GetAllProductsUseCase getAllProductsUseCase;
  final ShowProductDetailsUseCase showProductDetailsUseCase;
  final SearchOnProductsUseCase searchOnProductsUseCase;

  ProductsCategoriesCubit({required this.getAllCategoriesUseCase, required this.getAllProductsUseCase, required this.showProductDetailsUseCase, required this.searchOnProductsUseCase})
      : super(InitialProductsCategoriesState());

  static ProductsCategoriesCubit get(context) => BlocProvider.of(context);

  bool _isCategoriesOptionSelected = true;

  bool isCategoriesOptionSelected() => _isCategoriesOptionSelected;

  void changeOptionSelectedState() {
    _isCategoriesOptionSelected = !isCategoriesOptionSelected();
    emit(ChangeOptionSelectedState(
        isCategoriesOptionSelected: _isCategoriesOptionSelected));
    if(isCategoriesOptionSelected()){
      getAllCategories();
    }
    else{
      getAllProducts();
    }
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

  Future<void> getAllProducts({String keyword = ""}) async {
    emit(const GetAllProductsState(products: [], isLoaded: false));
    if(_products.isEmpty){
      var productsModel = await getAllProductsUseCase(parameters: GetAllProductsUseCaseParameters());
      _products = productsModel.products
          ?? [];
    }

      emit(GetAllProductsState(products: _products, isLoaded: true));
  }


  ProductModel showProductDetails({required int productTd}){
    ProductModel product = _products.where((p) => p.id == productTd).first;
    return showProductDetailsUseCase(parameters: ShowProductDetailsUseCaseParameters(product: product));
  }


  void searchOnProducts({required String keyword}){
    searchOnProductsUseCase(parameters: (){ // search method
      var tempProduct = _products;
      _products = _products.where((p) => p.title!.toUpperCase().contains(keyword.toUpperCase()) || p.description!.toUpperCase().contains(keyword.toUpperCase()) || p.rating!.rate.toString().toUpperCase().contains(keyword.toUpperCase()) || p.rating!.rate.toString().toUpperCase().contains(keyword.toUpperCase()) || p.price.toString().toUpperCase().contains(keyword.toUpperCase()) || p.category!.toUpperCase().contains(keyword.toUpperCase())).toList();
      emit(GetAllProductsState(products: _products, isLoaded: true));
      _products = tempProduct;
    });
  }

}