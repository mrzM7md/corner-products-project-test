import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiConstance {
  // base link
  static const String httpServerLink = "https://fakestoreapi.com";

  // start endpoints
  static const String httpLinkGetAllCategories = '$httpServerLink/products/categories';
  static const String httpLinkGetAllProducts = '$httpServerLink/products';


  static Future<http.Response> postRequest({
    required String url,
    required Map<String, dynamic> data
  }) async {
    return await http.post(
      Uri.parse(url),
        body: json.encode(data),
        headers: {'Content-Type': 'application/json'},
    );
  }


  static Future<http.Response> getRequest({required String url}) async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    return response;
  }


}
