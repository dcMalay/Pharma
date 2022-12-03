import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pharma/query/seller/global.dart';
import 'package:pharma/query/seller/product/get_user_products.dart';

Future<GetProductsModel?> getProductSearchMethod(BuildContext context,
    {required String q}) async {
  try {
    var data = await SellerGlobalHandler.requestGet(
        '/seller/auth/products/seller/' + (q.isEmpty ? " " : q));

    var jsonData = jsonDecode(data.body);

    GetProductsModel response = GetProductsModel.fromJson(jsonData);
    // prnum(response.toJson());
    return response;
  } catch (e) {
    SellerGlobalHandler.snackBar(
        context: context, message: e.toString(), isError: true);
    return null;
  }
}
