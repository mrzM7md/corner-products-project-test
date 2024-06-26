import 'dart:convert';

import 'package:test_corner_products/core/network/server_exception.dart';
import 'package:test_corner_products/features/products_categories/categories/models/categories_model.dart';
import 'package:test_corner_products/features/products_categories/categories/repository/categories_repository.dart';
import 'package:test_corner_products/features/products_categories/categories/requests_responses/categories_requests.dart';

class CategoriesResponses implements CategoriesRepository {
  BaseCategoriesRequests baseCategoriesRequests;
  CategoriesResponses({required this.baseCategoriesRequests});

  @override
  Future<CategoriesModel> getAllCategories() {
    return baseCategoriesRequests.getAllCategories().then((response){
      var jsonData = jsonDecode(response.body);
      if(response.statusCode == 200) {
        return CategoriesModel.fromJson(json: {"categories":jsonData});
      }
      return throw ServerException();
    });
  }
}