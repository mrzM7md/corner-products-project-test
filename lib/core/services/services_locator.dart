import 'package:get_it/get_it.dart';
import 'package:test_corner_products/features/products_categories/bussiness/products_categories_cubit.dart';
import 'package:test_corner_products/features/products_categories/categories/models/categories_model.dart';
import 'package:test_corner_products/features/products_categories/categories/requests_responses/categories_requests.dart';
import 'package:test_corner_products/features/products_categories/categories/requests_responses/categories_responses.dart';
import 'package:test_corner_products/features/products_categories/categories/usecases/get_all_categories_use_case.dart';
import 'package:test_corner_products/features/products_categories/categories/usecases/search_on_categories_use_case.dart';
import 'package:test_corner_products/features/products_categories/products/requests_responses/products_requests.dart';
import 'package:test_corner_products/features/products_categories/products/requests_responses/products_responses.dart';
import 'package:test_corner_products/features/products_categories/products/usecases/get_all_products_use_case.dart';
import 'package:test_corner_products/features/products_categories/products/usecases/search_on_products_use_case.dart';
import 'package:test_corner_products/features/products_categories/products/usecases/show_product_details_use_case.dart';
final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerLazySingleton(() => CategoriesRequests(),);
    sl.registerLazySingleton(() => CategoriesResponses(baseCategoriesRequests: sl<CategoriesRequests>()), );
    sl.registerLazySingleton(() => GetAllCategoriesUseCase(categoriesRepository: sl<CategoriesResponses>()), );

    sl.registerLazySingleton(() => ProductsRequests(),);
    sl.registerLazySingleton(() => ProductsResponses(baseProductsRequests: sl<ProductsRequests>()), );
    sl.registerLazySingleton(() => GetAllProductsUseCase(productsRepository: sl<ProductsResponses>()), );

    sl.registerLazySingleton(() => ShowProductDetailsUseCase());
    sl.registerLazySingleton(() => SearchOnProductsUseCase());
    sl.registerLazySingleton(() => SearchOnCategoriesUseCase());

    sl.registerLazySingleton(() => ProductsCategoriesCubit(
      getAllCategoriesUseCase: sl<GetAllCategoriesUseCase>(),
      getAllProductsUseCase: sl<GetAllProductsUseCase>(),
      showProductDetailsUseCase: sl<ShowProductDetailsUseCase>(),
      searchOnProductsUseCase: sl<SearchOnProductsUseCase>(),
      searchOnCategoriesUseCase: sl<SearchOnCategoriesUseCase>(),
    )..changeOptionSelectedState(),) ;

    sl.registerLazySingleton(() => const CategoriesModel(categories: [],));
  }

}
