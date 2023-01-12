import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharma/query/const.dart';
import '../model/seller_product_model.dart';

// Future<List<SellerProductModel>> getsellerProducts(String authToken) async {
//   final response = await http.get(
//     Uri.parse('$baseUrl/user/get/10/product/homepage'),
//     headers: {
//       HttpHeaders.contentTypeHeader: "application/json",
//       "auth-token": authToken
//     },
//   );
//   // print('authcode--->$authToken');
//   // print("status code --->${response.statusCode}");
//   if (response.statusCode == 200) {
//     List jsonRespone = json.decode(response.body);
//     // print('---->${response.body}');
//     var data = jsonRespone.map((e) => SellerProductModel.fromJson(e)).toList();
//     print(">>>>>${data[0].resultProducts![0]!.productName}");
//     return data;
//   } else {
//     throw Exception('getting error');
//   }
// }

Future<List<dynamic>> getsellerProducts(String authToken) async {
  final response = await http.get(
    Uri.parse('$baseUrl/user/get/10/product/homepage'),
    headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      "auth-token": authToken
    },
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
