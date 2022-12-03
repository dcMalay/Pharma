import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pharma/query/buyer/global.dart';

Future<BuyerAccountResponse?> buyerCreateAccountMethod(BuildContext context,
    {required Map<String, String>? body}) async {
  try {
    var data =
        await BuyerGlobalHandler.requestPost('/buyer/auth/register', body);

    var jsonData = jsonDecode(data.body);

    BuyerAccountResponse response = BuyerAccountResponse.fromJson(jsonData);
    return response;
  } catch (e) {
    BuyerGlobalHandler.snackBar(
        context: context, message: e.toString(), isError: true);
    return null;
  }
}

class BuyerAccountResponse {
  int? status;
  String? message;

  BuyerAccountResponse({this.status, this.message});

  BuyerAccountResponse.fromJson(Map<String, dynamic> json) {
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
