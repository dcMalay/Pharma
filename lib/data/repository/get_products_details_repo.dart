import 'dart:io';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharma/query/const.dart';

import '../model/products_details_model.dart';

Future<ProductsDetailsModel> getProductDetails(productId) async {
  final response = await http.get(
    Uri.parse('$baseUrl/buyer/un/auth/products/per/$productId'),
    headers: {HttpHeaders.contentTypeHeader: "application/json"},
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    var jsonRespone = json.decode(response.body);
    var data = ProductsDetailsModel.fromJson(jsonRespone);
    return data;
  } else {
    throw Exception('getting error');
  }
}
