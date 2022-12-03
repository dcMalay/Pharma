import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pharma/query/buyer/global.dart';

Future<CartResponse?> addCartMethod(BuildContext context,
    {required ParamsCart body}) async {
  try {
    var data =
        await BuyerGlobalHandler.requestPost('/buyer/auth/cart', body.toJson());
    print(data.body);
    var jsonData = jsonDecode(data.body);

    CartResponse response = CartResponse.fromJson(jsonData);
    print(response.toJson());
    return response;
  } catch (e) {
    BuyerGlobalHandler.snackBar(
        context: context, message: e.toString(), isError: true);
    return null;
  }
}

class ParamsCart {
  String? productId;
  String? quantity;
  String? priceDetails;

  ParamsCart({this.productId, this.quantity, this.priceDetails});

  ParamsCart.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'];
    priceDetails = json['price_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['price_details'] = this.priceDetails;
    return data;
  }
}

class CartResponse {
  int? status;
  String? message;
  int? otp;

  CartResponse({this.status, this.message, this.otp});

  CartResponse.fromJson(Map<String, dynamic> json) {
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
