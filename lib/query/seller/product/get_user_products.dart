import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pharma/query/seller/global.dart';

Future<GetProductsModel?> getProductMethod(BuildContext context) async {
  try {
    var data =
        await SellerGlobalHandler.requestGet('/seller/auth/products/seller');

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

class GetProductsModel {
  num? status;
  String? message;
  List<ResultProducts>? resultProducts;

  GetProductsModel({this.status, this.message, this.resultProducts});

  GetProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result_products'] != null) {
      resultProducts = <ResultProducts>[];
      json['result_products'].forEach((v) {
        resultProducts!.add(new ResultProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.resultProducts != null) {
      data['result_products'] =
          this.resultProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResultProducts {
  String? sId;
  String? sellerId;
  List<String>? imageList;
  String? productName;
  num? productPrice;
  String? companyName;
  num? minOrderQty;
  num? maxOrderQty;
  String? expireDate;
  DiscountDetails? discountDetails;
  num? stock;
  bool? bulk;
  List<ExtraFields>? extraFields;
  Categories? categories;
  String? chemicalCombination;
  String? date;
  num? status;
  num? iV;
  DiscountFormDetails? discountFormDetails;

  ResultProducts(
      {this.sId,
      this.sellerId,
      this.imageList,
      this.productName,
      this.productPrice,
      this.companyName,
      this.minOrderQty,
      this.maxOrderQty,
      this.expireDate,
      this.discountDetails,
      this.stock,
      this.bulk,
      this.extraFields,
      this.categories,
      this.chemicalCombination,
      this.date,
      this.status,
      this.iV,
      this.discountFormDetails});

  ResultProducts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sellerId = json['seller_id'];
    imageList = json['image_list'].cast<String>();
    productName = json['product_name'];
    productPrice = json['product_price'];
    companyName = json['company_name'];
    minOrderQty = json['min_order_qty'];
    maxOrderQty = json['max_order_qty'];
    expireDate = json['expire_date'];
    discountDetails = json['discount_details'] != null
        ? new DiscountDetails.fromJson(json['discount_details'])
        : null;
    stock = json['stock'];
    bulk = json['bulk'];
    if (json['extra_fields'] != null) {
      extraFields = <ExtraFields>[];
      json['extra_fields'].forEach((v) {
        extraFields!.add(new ExtraFields.fromJson(v));
      });
    }
    categories = json['categories'] != null
        ? new Categories.fromJson(json['categories'])
        : null;
    chemicalCombination = json['chemical_combination'];
    date = json['date'];
    status = json['status'];
    iV = json['__v'];
    discountFormDetails = json['discount_form_details'] != null
        ? new DiscountFormDetails.fromJson(json['discount_form_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['seller_id'] = this.sellerId;
    data['image_list'] = this.imageList;
    data['product_name'] = this.productName;
    data['product_price'] = this.productPrice;
    data['company_name'] = this.companyName;
    data['min_order_qty'] = this.minOrderQty;
    data['max_order_qty'] = this.maxOrderQty;
    data['expire_date'] = this.expireDate;
    if (this.discountDetails != null) {
      data['discount_details'] = this.discountDetails!.toJson();
    }
    data['stock'] = this.stock;
    data['bulk'] = this.bulk;
    if (this.extraFields != null) {
      data['extra_fields'] = this.extraFields!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.toJson();
    }
    data['chemical_combination'] = this.chemicalCombination;
    data['date'] = this.date;
    data['status'] = this.status;
    data['__v'] = this.iV;
    if (this.discountFormDetails != null) {
      data['discount_form_details'] = this.discountFormDetails!.toJson();
    }
    return data;
  }
}

class DiscountDetails {
  bool? status;
  num? finalPtr;
  num? discount;
  num? ptr;
  num? ptrPer;
  num? gst;
  num? gstValue;
  num? retailPercentage;
  num? finalUserBuy;
  num? finalOrderValue;
  String? message;
  num? bonus;
  num? bonusGet;
  String? productName;

  DiscountDetails(
      {this.status,
      this.finalPtr,
      this.discount,
      this.ptr,
      this.ptrPer,
      this.gst,
      this.gstValue,
      this.retailPercentage,
      this.finalUserBuy,
      this.finalOrderValue,
      this.message,
      this.bonus,
      this.bonusGet,
      this.productName});

  DiscountDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    finalPtr = json['final_ptr'];
    discount = json['discount'];
    ptr = json['ptr'];
    ptrPer = num.parse(json['per_ptr'].toStringAsFixed(2));
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
    data['final_ptr'] = this.finalPtr;
    data['discount'] = this.discount;
    data['ptr'] = this.ptr;
    data['ptr_per'] = this.ptrPer;
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

class ExtraFields {
  String? key;
  String? value;

  ExtraFields({this.key, this.value});

  ExtraFields.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
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

class DiscountFormDetails {
  num? gstPercentage;
  num? mrp;
  num? minQtySale;
  num? maxQtySale;
  num? userBuy;

  num? buy;
  num? get;
  num? discountOnPtrOnlyPercenatge;
  String? producName;

  DiscountFormDetails(
      {this.discountOnPtrOnlyPercenatge,
      this.gstPercentage,
      this.mrp,
      this.minQtySale,
      this.maxQtySale,
      this.userBuy,
      this.get,
      this.buy,
      this.producName});

  DiscountFormDetails.fromJson(Map<String, dynamic> json) {
    gstPercentage = json['gstPercentage'];
    mrp = json['mrp'];
    minQtySale = json['minQtySale'];
    maxQtySale = json['maxQtySale'];
    userBuy = json['userBuy'];
    buy = json['buy'];
    get = json['get'];
    discountOnPtrOnlyPercenatge = json['discountOnPtrOnlyPercenatge'];
    producName = json['producName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['gstPercentage'] = this.gstPercentage;
    data['mrp'] = this.mrp;
    data['minQtySale'] = this.minQtySale;
    data['maxQtySale'] = this.maxQtySale;
    data['userBuy'] = this.userBuy;
    data['buy'] = this.buy;
    data['get'] = this.get;
    data['producName'] = this.producName;
    data['discountOnPtrOnlyPercenatge'] = this.discountOnPtrOnlyPercenatge;
    return data;
  }
}
