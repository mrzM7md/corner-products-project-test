import 'dart:convert';

import 'package:test_corner_products/core/network/server_exception.dart';
import 'package:test_corner_products/features/products_categories/products/models/products_model.dart';
import 'package:test_corner_products/features/products_categories/products/repository/products_repository.dart';
import 'package:test_corner_products/features/products_categories/products/requests_responses/products_requests.dart';

class ProductsResponses implements ProductsRepository {
  final BaseProductsRequests baseProductsRequests;
  ProductsResponses({required this.baseProductsRequests});

  @override
  Future<ProductsModel> getAllProducts() {
    return baseProductsRequests.getAllFoods().then((response){
      print("pro response");
      var jsonData = jsonDecode(response.body);
      print("data: $jsonData}");
      if(response.statusCode == 200) {
        return ProductsModel.fromJson(json: {"products": jsonData});
      }
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(jsonData),
      );
    });
  }

}