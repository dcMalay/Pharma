import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pharma/query/buyer/global.dart';
import 'package:pharma/query/seller/product/get_user_products.dart';

Future<GetProductsModel?> buyerGetCategoryProductMethod(BuildContext context,
    {required ParamsCategoryProducts params}) async {
  try {
    var data = await BuyerGlobalHandler.requestPost(
        '/buyer/un/auth/products', params.toJson());

    var jsonData = jsonDecode(data.body);

    GetProductsModel response = GetProductsModel.fromJson(jsonData);
    return response;
  } catch (e) {
    BuyerGlobalHandler.snackBar(
        context: context, message: e.toString(), isError: true);
    return null;
  }
}

class ParamsCategoryProducts {
  String? category;
  String? subCategory;

  ParamsCategoryProducts({this.category, this.subCategory});

  ParamsCategoryProducts.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    subCategory = json['sub_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['sub_category'] = this.subCategory;
    return data;
  }
}
