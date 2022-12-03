import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:pharma/query/buyer/global.dart';

Future<GetCartResponse?> getCartMethod(BuildContext context) async {
  try {
    var data = await BuyerGlobalHandler.requestGet('/buyer/auth/cart');

    var jsonData = jsonDecode(data.body);

    GetCartResponse response = GetCartResponse.fromJson(jsonData);

    return response;
  } catch (e) {
    BuyerGlobalHandler.snackBar(
        context: context, message: e.toString(), isError: true);
    return null;
  }
}

class GetCartResponse {
  int? status;
  String? message;
  num? totalAmount;
  bool? isCheckedOut;
  List<ResultCart>? resultCart;
  String? orderToken;
  PaymentDetails? paymentDetails;

  GetCartResponse(
      {this.status,
      this.message,
      this.totalAmount,
      this.isCheckedOut,
      this.resultCart,
      this.paymentDetails,
      this.orderToken});

  GetCartResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    paymentDetails = json['payment_details'] != null
        ? new PaymentDetails.fromJson(json['payment_details'])
        : null;
    totalAmount = json['total_amount'];
    isCheckedOut = json['is_checked_out'];
    if (json['result_cart'] != null) {
      resultCart = <ResultCart>[];
      json['result_cart'].forEach((v) {
        resultCart!.add(new ResultCart.fromJson(v));
      });
    }
    orderToken = json['order_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.paymentDetails != null) {
      data['payment_details'] = this.paymentDetails!.toJson();
    }
    data['total_amount'] = this.totalAmount;
    data['is_checked_out'] = this.isCheckedOut;
    if (this.resultCart != null) {
      data['result_cart'] = this.resultCart!.map((v) => v.toJson()).toList();
    }
    data['order_token'] = this.orderToken;
    return data;
  }
}

class ResultCart {
  String? cartId;
  String? productId;
  String? productName;
  String? sellerId;
  int? productPrice;
  String? productImage;
  int? stock;
  bool? bulk;
  Categories? categories;
  String? companyName;
  int? minOrderQty;
  int? maxOrderQty;
  String? expireDate;
  Pricing? pricing;
  int? quantity;
  List<Details>? details;

  ResultCart(
      {this.cartId,
      this.productId,
      this.productName,
      this.sellerId,
      this.productPrice,
      this.productImage,
      this.stock,
      this.bulk,
      this.categories,
      this.companyName,
      this.minOrderQty,
      this.maxOrderQty,
      this.expireDate,
      this.pricing,
      this.quantity,
      this.details});

  ResultCart.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    sellerId = json['seller_id'];
    productPrice = json['product_price'];
    productImage = json['product_image'];
    stock = json['stock'];
    bulk = json['bulk'];
    categories = json['categories'] != null
        ? new Categories.fromJson(json['categories'])
        : null;
    companyName = json['company_name'];
    minOrderQty = json['min_order_qty'];
    maxOrderQty = json['max_order_qty'];
    expireDate = json['expire_date'];
    pricing =
        json['pricing'] != null ? new Pricing.fromJson(json['pricing']) : null;
    quantity = json['quantity'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['seller_id'] = this.sellerId;
    data['product_price'] = this.productPrice;
    data['product_image'] = this.productImage;
    data['stock'] = this.stock;
    data['bulk'] = this.bulk;
    if (this.categories != null) {
      data['categories'] = this.categories!.toJson();
    }
    data['company_name'] = this.companyName;
    data['min_order_qty'] = this.minOrderQty;
    data['max_order_qty'] = this.maxOrderQty;
    data['expire_date'] = this.expireDate;
    if (this.pricing != null) {
      data['pricing'] = this.pricing!.toJson();
    }
    data['quantity'] = this.quantity;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? categoryName;
  String? subCategoryName;

  Categories({this.categoryName, this.subCategoryName});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    subCategoryName = json['sub_category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_name'] = this.categoryName;
    data['sub_category_name'] = this.subCategoryName;
    return data;
  }
}

class Pricing {
  bool? status;
  String? type;
  num? finalPtr;
  int? discount;
  num? ptr;
  int? gst;
  num? gstValue;
  num? retailPercentage;
  int? finalUserBuy;
  num? finalOrderValue;
  String? message;
  num? bonus;
  int? bonusGet;
  String? productName;

  Pricing(
      {this.status,
      this.type,
      this.finalPtr,
      this.discount,
      this.ptr,
      this.gst,
      this.gstValue,
      this.retailPercentage,
      this.finalUserBuy,
      this.finalOrderValue,
      this.message,
      this.bonus,
      this.bonusGet,
      this.productName});

  Pricing.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    type = json['type'];
    finalPtr = json['final_ptr'];
    discount = json['discount'];
    ptr = json['ptr'];
    gst = json['gst'];
    gstValue = json['gst_value'];
    retailPercentage = json['retail_percentage'];
    finalUserBuy = json['final_user_buy'];
    finalOrderValue = json['final_order_value'];
    message = json['message'];
    bonus = json['bonus'];
    bonusGet = json['bonus_get'];
    productName = json['product_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['type'] = this.type;
    data['final_ptr'] = this.finalPtr;
    data['discount'] = this.discount;
    data['ptr'] = this.ptr;
    data['gst'] = this.gst;
    data['gst_value'] = this.gstValue;
    data['retail_percentage'] = this.retailPercentage;
    data['final_user_buy'] = this.finalUserBuy;
    data['final_order_value'] = this.finalOrderValue;
    data['message'] = this.message;
    data['bonus'] = this.bonus;
    data['bonus_get'] = this.bonusGet;
    data['product_name'] = this.productName;
    return data;
  }
}

class Details {
  String? key;
  String? value;

  Details({this.key, this.value});

  Details.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value.toString();
    return data;
  }
}

class PaymentDetails {
  int? status;
  String? data;

  PaymentDetails({this.status, this.data});

  PaymentDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    return data;
  }
}
