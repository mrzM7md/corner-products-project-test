import 'package:http/http.dart';
import 'package:test_corner_products/core/network/api_constance.dart';

abstract class BaseProductsRequests{
  Future<Response> getAllFoods();
}

class ProductsRequests implements BaseProductsRequests {
  @override
  Future<Response> getAllFoods() {
    return ApiConstance.getRequest(url: ApiConstance.httpLinkGetAllProducts);
  }

}