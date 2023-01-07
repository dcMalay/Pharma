// To parse this JSON data, do
//
//     final sellerProductModel = sellerProductModelFromJson(jsonString);

import 'dart:convert';

SellerProductModel? sellerProductModelFromJson(String str) =>
    SellerProductModel.fromJson(json.decode(str));

String sellerProductModelToJson(SellerProductModel? data) =>
    json.encode(data!.toJson());

class SellerProductModel {
  SellerProductModel({
    this.status,
    this.message,
    this.resultProducts,
  });

  int? status;
  String? message;
  List<ResultProduct?>? resultProducts;

  factory SellerProductModel.fromJson(Map<String, dynamic> json) =>
      SellerProductModel(
        status: json["status"],
        message: json["message"],
        resultProducts: json["result_products"] == null
            ? []
            : List<ResultProduct?>.from(
                json["result_products"]!.map((x) => ResultProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result_products": resultProducts == null
            ? []
            : List<dynamic>.from(resultProducts!.map((x) => x!.toJson())),
      };
}

class ResultProduct {
  ResultProduct({
    this.id,
    this.sellerId,
    this.imageList,
    this.productName,
    this.productPrice,
    this.companyName,
    this.minOrderQty,
    this.maxOrderQty,
    this.expireDate,
    this.discountDetails,
    this.discountFormDetails,
    this.stock,
    this.bulk,
    this.extraFields,
    this.categories,
    this.chemicalCombination,
    this.date,
    this.status,
    this.v,
  });

  String? id;
  String? sellerId;
  List<String?>? imageList;
  String? productName;
  int? productPrice;
  String? companyName;
  int? minOrderQty;
  int? maxOrderQty;
  DateTime? expireDate;
  DiscountDetails? discountDetails;
  Map<String, int?>? discountFormDetails;
  int? stock;
  bool? bulk;
  List<ExtraField?>? extraFields;
  Categories? categories;
  String? chemicalCombination;
  DateTime? date;
  int? status;
  int? v;

  factory ResultProduct.fromJson(Map<String, dynamic> json) => ResultProduct(
        id: json["_id"],
        sellerId: json["seller_id"],
        imageList: json["image_list"] == null
            ? []
            : List<String?>.from(json["image_list"]!.map((x) => x)),
        productName: json["product_name"],
        productPrice: json["product_price"],
        companyName: json["company_name"],
        minOrderQty: json["min_order_qty"],
        maxOrderQty: json["max_order_qty"],
        expireDate: DateTime.parse(json["expire_date"]),
        discountDetails: DiscountDetails.fromJson(json["discount_details"]),
        discountFormDetails: Map.from(json["discount_form_details"]!)
            .map((k, v) => MapEntry<String, int?>(k, v)),
        stock: json["stock"],
        bulk: json["bulk"],
        extraFields: json["extra_fields"] == null
            ? []
            : List<ExtraField?>.from(
                json["extra_fields"]!.map((x) => ExtraField.fromJson(x))),
        categories: Categories.fromJson(json["categories"]),
        chemicalCombination: json["chemical_combination"],
        date: DateTime.parse(json["date"]),
        status: json["status"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "seller_id": sellerId,
        "image_list": imageList == null
            ? []
            : List<dynamic>.from(imageList!.map((x) => x)),
        "product_name": productName,
        "product_price": productPrice,
        "company_name": companyName,
        "min_order_qty": minOrderQty,
        "max_order_qty": maxOrderQty,
        "expire_date": expireDate?.toIso8601String(),
        "discount_details": discountDetails!.toJson(),
        "discount_form_details": Map.from(discountFormDetails!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "stock": stock,
        "bulk": bulk,
        "extra_fields": extraFields == null
            ? []
            : List<dynamic>.from(extraFields!.map((x) => x!.toJson())),
        "categories": categories!.toJson(),
        "chemical_combination": chemicalCombination,
        "date": date?.toIso8601String(),
        "status": status,
        "__v": v,
      };
}

class Categories {
  Categories({
    this.categoryName,
    this.subCategoryName,
  });

  String? categoryName;
  String? subCategoryName;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        categoryName: json["category_name"],
        subCategoryName: json["sub_category_name"],
      );

  Map<String, dynamic> toJson() => {
        "category_name": categoryName,
        "sub_category_name": subCategoryName,
      };
}

class DiscountDetails {
  DiscountDetails({
    this.status,
    this.type,
    this.finalPtr,
    this.discount,
    this.ptr,
    this.perPtr,
    this.gst,
    this.gstValue,
    this.retailPercentage,
    this.finalUserBuy,
    this.finalOrderValue,
    this.message,
    this.bonus,
  });

  bool? status;
  String? type;
  double? finalPtr;
  int? discount;
  double? ptr;
  double? perPtr;
  int? gst;
  double? gstValue;
  double? retailPercentage;
  int? finalUserBuy;
  double? finalOrderValue;
  String? message;
  int? bonus;

  factory DiscountDetails.fromJson(Map<String, dynamic> json) =>
      DiscountDetails(
        status: json["status"],
        type: json["type"],
        finalPtr: json["final_ptr"].toDouble(),
        discount: json["discount"],
        ptr: json["ptr"].toDouble(),
        perPtr: json["per_ptr"].toDouble(),
        gst: json["gst"],
        gstValue: json["gst_value"].toDouble(),
        retailPercentage: json["retail_percentage"].toDouble(),
        finalUserBuy: json["final_user_buy"],
        finalOrderValue: json["final_order_value"].toDouble(),
        message: json["message"],
        bonus: json["bonus"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "type": type,
        "final_ptr": finalPtr,
        "discount": discount,
        "ptr": ptr,
        "per_ptr": perPtr,
        "gst": gst,
        "gst_value": gstValue,
        "retail_percentage": retailPercentage,
        "final_user_buy": finalUserBuy,
        "final_order_value": finalOrderValue,
        "message": message,
        "bonus": bonus,
      };
}

class ExtraField {
  ExtraField({
    this.key,
    this.value,
  });

  String? key;
  String? value;

  factory ExtraField.fromJson(Map<String, dynamic> json) => ExtraField(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}
