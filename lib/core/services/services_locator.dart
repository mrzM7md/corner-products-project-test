import 'package:get_it/get_it.dart';
import 'package:test_corner_products/features/products_categories/bussiness/products_categories_cubit.dart';
import 'package:test_corner_products/features/products_categories/bussiness/products_categories_states.dart';
import 'package:test_corner_products/features/products_categories/categories/models/categories_model.dart';
import 'package:test_corner_products/features/products_categories/categories/requests_responses/categories_requests.dart';
import 'package:test_corner_products/features/products_categories/categories/requests_responses/categories_responses.dart';
import 'package:test_corner_products/features/products_categories/categories/usecases/get_all_categories_use_case.dart';
final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerLazySingleton(() => CategoriesRequests(),);
    sl.registerLazySingleton(() => CategoriesResponses(baseCategoriesRequests: sl<CategoriesRequests>()), );
    sl.registerLazySingleton(() => GetAllCategoriesUseCase(categoriesRepository: sl<CategoriesResponses>()), );

    sl.registerLazySingleton(() => const CategoriesModel(categories: [],));
  }

}
