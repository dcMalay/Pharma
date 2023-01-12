import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pharma/query/const.dart';

import '../../query/seller/global.dart';

Future addtoCart(String id, String qty, String price) async {
  final String? authToken = await SellerGlobalHandler.getToken();
  final data = await http.post(Uri.parse('$baseUrl/buyer/auth/cart'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        "auth-token": authToken!
      },
      body: json.encode({
        "product_id": id,
        "quantity": qty,
        "price_details": price,
        "delivary_date": ""
      }));
  print(data.statusCode);
}
