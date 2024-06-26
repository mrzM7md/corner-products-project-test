import 'package:http/http.dart';
import 'package:test_corner_products/core/network/api_constance.dart';

abstract class BaseCategoriesRequests{
  Future<Response> getAllCategories();
}

class CategoriesRequests implements BaseCategoriesRequests {
  @override
  Future<Response> getAllCategories() {
    return ApiConstance.getRequest(url: ApiConstance.httpLinkGetAllCategories);
  }

}