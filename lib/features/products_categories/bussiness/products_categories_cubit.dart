import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_corner_products/features/products_categories/bussiness/products_categories_states.dart';
import 'package:test_corner_products/features/products_categories/categories/usecases/get_all_categories_use_case.dart';

class ProductsCategoriesCubit extends Cubit<ProductsCategoriesState> {

  final GetAllCategoriesUseCase getAllCategoriesUseCase;

  ProductsCategoriesCubit({required this.getAllCategoriesUseCase})
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


}