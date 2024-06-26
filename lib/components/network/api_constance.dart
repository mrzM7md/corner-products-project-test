import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class ApiConstance {
  // base link
  static const String httpServerLink = "https://smartmenulocalapi.runasp.net/api";

  // start endpoints
  static const String httpLinkAddNewGuest = '$httpServerLink/Guests/Add-New-Guest';
  static const String httpLinkGetAllCategories = '$httpServerLink/Categories/GetAllCategoriesAsync';
  static const String httpLinkGetAllFoods = '$httpServerLink/Foods/GetAllFoodsAsync';

  static const String httpLinkAddBill = '$httpServerLink/Bills/Add-New-Bill-Async';
  static String httpLinkGetBill({required int billId}) => '$httpServerLink/Bills/Get-Bill-With-Details-Async?billId=$billId';

  static String httpLinkGetCustomerBill({required int guestId}) => '$httpServerLink/Guests/Get-AllGuest-Bills?guestId=$guestId';


  static const String httpLinkGetAllTables = '$httpServerLink/Tables/GetAllTables-Async';
  // end endpoints


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
