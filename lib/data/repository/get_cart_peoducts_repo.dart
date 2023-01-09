import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pharma/query/const.dart';

import '../../query/seller/global.dart';

Future<List<dynamic>> getbagProducts() async {
  final String? authToken = await SellerGlobalHandler.getToken();
  final response = await http.get(
    Uri.parse('$baseUrl/buyer/auth/cart'),
    headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      "auth-token": authToken!
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
