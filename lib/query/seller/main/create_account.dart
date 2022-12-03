import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pharma/query/seller/global.dart';

Future<SellerAccountResponse?> sellerCreateAccountMethod(BuildContext context,
    {required Map<String, String>? body}) async {
  try {
    var data =
        await SellerGlobalHandler.requestPost('/seller/auth/register', body);

    var jsonData = jsonDecode(data.body);

    SellerAccountResponse response = SellerAccountResponse.fromJson(jsonData);
    return response;
  } catch (e) {
    SellerGlobalHandler.snackBar(
        context: context, message: e.toString(), isError: true);
    return null;
  }
}

class SellerAccountResponse {
  int? status;
  String? message;

  SellerAccountResponse({this.status, this.message});

  SellerAccountResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
