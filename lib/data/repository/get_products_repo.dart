import 'dart:io';
import 'package:pharma/data/model/products_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharma/query/const.dart';

Future<List<dynamic>> getProducts() async {
  final response = await http.get(
    Uri.parse('$baseUrl/user/get/10/product/homepage'),
    headers: {HttpHeaders.contentTypeHeader: "application/json"},
  );
  print("status code --->${response.statusCode}");
  if (response.statusCode == 200) {
    print('---->${response.body}');
    late List<dynamic> data;
    try {
      data = json.decode(response.body);
      print(data);
      // data = jsonRespone.values.map((e) => e as Map<String, dynamic>).toList();
    } catch (e) {
      print('error----->$e');
    }

    return data;
  } else {
    throw Exception('getting error');
  }
}

// Future<List<ProductModel>> getProducts() async {
//   final response = await http.get(
//     Uri.parse('$baseUrl/user/get/10/product/homepage'),
//     headers: {HttpHeaders.contentTypeHeader: "application/json"},
//   );
//   print("status code --->${response.statusCode}");
//   if (response.statusCode == 200) {
//     var jsonRespone = json.decode(response.body);
//     print('---->${response.body}');
//     var data =
//         jsonRespone.map((dynamic e) => ProductModel.fromJson(e)).toList();
//     print(">>>>>$data");
//     return data;
//   } else {
//     throw Exception('getting error');
//   }
// }
