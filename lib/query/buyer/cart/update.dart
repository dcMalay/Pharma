import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pharma/query/buyer/global.dart';

Future<CartResponseDel?> updateCartMethod(BuildContext context,
    {required String id, required String quantity}) async {
  try {
    var data = await BuyerGlobalHandler.requestPost('/buyer/auth/cart/update', {
      'id': id,
      "quantity": quantity,
    });
    print(data.body);
    var jsonData = jsonDecode(data.body);

    CartResponseDel response = CartResponseDel.fromJson(jsonData);
    return response;
  } catch (e) {
    BuyerGlobalHandler.snackBar(
        context: context, message: e.toString(), isError: true);
    return null;
  }
}

class CartResponseDel {
  int? status;
  String? message;
  int? otp;

  CartResponseDel({this.status, this.message, this.otp});

  CartResponseDel.fromJson(Map<String, dynamic> json) {
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
