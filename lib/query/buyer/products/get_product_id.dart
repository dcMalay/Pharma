import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pharma/query/buyer/global.dart';
import 'package:pharma/query/seller/product/get_user_products.dart';

Future<GetProductModel?> buyerGetProductWithIdMethod(BuildContext context,
    {required String id}) async {
  try {
    var data = await BuyerGlobalHandler.requestGet(
        '/buyer/un/auth/products/per/' + id);

    var jsonData = jsonDecode(data.body);

    GetProductModel response = GetProductModel.fromJson(jsonData);
    return response;
  } catch (e) {
    BuyerGlobalHandler.snackBar(
        context: context, message: e.toString(), isError: true);
    return null;
  }
}

class GetProductModel {
  int? status;
  String? message;
  ResultProducts? resultProducts;

  GetProductModel({this.status, this.message, this.resultProducts});

  GetProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    resultProducts = json['result_products'] != null
        ? new ResultProducts.fromJson(json['result_products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.resultProducts != null) {
      data['result_products'] = this.resultProducts!.toJson();
    }
    return data;
  }
}
