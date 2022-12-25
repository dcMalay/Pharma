import 'dart:io';

import 'package:pharma/data/model/products_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharma/query/const.dart';

Future<List<ProductsModel>> getProducts() async {
  final response = await http.get(
    Uri.parse('$baseUrl/user/get/10/product/homepage'),
    headers: {HttpHeaders.contentTypeHeader: "application/json"},
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    List jsonRespone = json.decode(response.body);
    var data = jsonRespone.map((e) => ProductsModel.fromJson(e)).toList();
    print(data);
    return data;
  } else {
    throw Exception('getting error');
  }
}
