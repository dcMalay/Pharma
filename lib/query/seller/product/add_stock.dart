import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pharma/query/seller/global.dart';

Future<ResponseProduct?> addProductMethod(BuildContext context,
    {required ProductModelRequest body}) async {
  try {
    var data =
        await SellerGlobalHandler.requestPost('/seller/auth/products/add', {
      'image_list': json.encode(body.imageList),
      "categories": json.encode(body.categories),
      'product_name': body.productName,
      'product_price': body.productPrice,
      'company_name': body.companyName,
      'min_order_qty': body.minOrderQty,
      'max_order_qty': body.maxOrderQty,
      'expire_date': body.expireDate,
      'discount_details': json.encode(body.discountDetails),
      'bulk': body.bulk.toString(),
      'stock': body.stock.toString(),
      'extra_fields': json.encode(body.extraFields),
      "chemical_combination": body.chemicalCombination,
      "discount_form_details": json.encode(body.discountFormDetails),
    });
    print(data);
    var jsonData = jsonDecode(data.body);

    ResponseProduct response = ResponseProduct.fromJson(jsonData);
    print(response.toJson());
    return response;
  } catch (e) {
    SellerGlobalHandler.snackBar(
        context: context, message: e.toString(), isError: true);
    return null;
  }
}

class ResponseProduct {
  int? status;
  String? message;

  ResponseProduct({this.status, this.message});

  ResponseProduct.fromJson(Map<String, dynamic> json) {
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

class ProductModelRequest {
  List<String>? imageList;
  Categories? categories;
  String? productName;
  String? productPrice;
  String? companyName;
  String? minOrderQty;
  String? maxOrderQty;
  String? expireDate;
  Map? discountDetails;
  String? bulk;
  String? stock;
  List<ExtraFields>? extraFields;
  String? chemicalCombination;
  Map? discountFormDetails;

  ProductModelRequest(
      {this.imageList,
      this.categories,
      this.productName,
      this.companyName,
      this.minOrderQty,
      this.maxOrderQty,
      this.productPrice,
      this.expireDate,
      this.discountDetails,
      this.bulk,
      this.stock,
      this.chemicalCombination,
      this.discountFormDetails,
      this.extraFields});

  ProductModelRequest.fromJson(Map<String, dynamic> json) {
    imageList = json['image_list'].cast<String>();
    categories = json['categories'] != null
        ? new Categories.fromJson(json['categories'])
        : null;
    productName = json['product_name'];
    productPrice = json['product_price'];
    companyName = json['company_name'];
    minOrderQty = json['min_order_qty'];
    maxOrderQty = json['max_order_qty'];
    expireDate = json['expire_date'];
    discountDetails = json['discount_details'];
    bulk = json['bulk'];
    stock = json['stock'];
    chemicalCombination = json['chemical_combination'];
    discountFormDetails = json['discount_form_details'];
    if (json['extra_fields'] != null) {
      extraFields = <ExtraFields>[];
      json['extra_fields'].forEach((v) {
        extraFields!.add(new ExtraFields.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_list'] = this.imageList;
    if (this.categories != null) {
      data['categories'] = this.categories!.toJson();
    }
    data['product_name'] = this.productName;
    data['product_price'] = this.productPrice;
    data['company_name'] = this.companyName;
    data['min_order_qty'] = this.minOrderQty;
    data['max_order_qty'] = this.maxOrderQty;
    data['expire_date'] = this.expireDate;
    data['discount_details'] = this.discountDetails;
    data['bulk'] = this.bulk;
    data['stock'] = this.stock;
    data['chemical_combination'] = this.chemicalCombination;
    data['discount_form_details'] = this.discountFormDetails;
    if (this.extraFields != null) {
      data['extra_fields'] = this.extraFields!.map((v) => v.toJson()).toList();
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

class ExtraFields {
  String? name;
  String? value;

  ExtraFields({this.name, this.value});

  ExtraFields.fromJson(Map<String, dynamic> json) {
    name = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.name;
    data['value'] = this.value;
    return data;
  }
}
