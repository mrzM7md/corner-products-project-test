import 'package:test_corner_products/core/network/use_cases/base_usecase.dart';

class SearchOnProductsUseCase implements BaseUseCase<void, Function>{
  @override
  void call({required Function parameters}) {
    parameters(); // search method
  }
}