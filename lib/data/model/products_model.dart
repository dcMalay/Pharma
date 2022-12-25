




class ProductsModel {
  ProductsModel({
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
  SellerId? sellerId;
  List<String>? imageList;
  String? productName;
  int? productPrice;
  String? companyName;
  int? minOrderQty;
  int? maxOrderQty;
  DateTime? expireDate;
  DiscountDetails? discountDetails;
  DiscountFormDetails? discountFormDetails;
  int? stock;
  bool? bulk;
  List<dynamic>? extraFields;
  Categories? categories;
  String? chemicalCombination;
  DateTime? date;
  int? status;
  int? v;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["_id"],
        sellerId: sellerIdValues.map[json["seller_id"]],
        imageList: List<String>.from(json["image_list"].map((x) => x)),
        productName: json["product_name"],
        productPrice: json["product_price"],
        companyName: json["company_name"],
        minOrderQty: json["min_order_qty"],
        maxOrderQty: json["max_order_qty"],
        expireDate: DateTime.parse(json["expire_date"]),
        discountDetails: DiscountDetails.fromJson(json["discount_details"]),
        discountFormDetails:
            DiscountFormDetails.fromJson(json["discount_form_details"]),
        stock: json["stock"],
        bulk: json["bulk"],
        extraFields: List<dynamic>.from(json["extra_fields"].map((x) => x)),
        categories: Categories.fromJson(json["categories"]),
        chemicalCombination: json["chemical_combination"],
        date: DateTime.parse(json["date"]),
        status: json["status"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "seller_id": sellerIdValues.reverse[sellerId],
        "image_list": List<dynamic>.from(imageList!.map((x) => x)),
        "product_name": productName,
        "product_price": productPrice,
        "company_name": companyName,
        "min_order_qty": minOrderQty,
        "max_order_qty": maxOrderQty,
        "expire_date": expireDate!.toIso8601String(),
        "discount_details": discountDetails!.toJson(),
        "discount_form_details": discountFormDetails!.toJson(),
        "stock": stock,
        "bulk": bulk,
        "extra_fields": List<dynamic>.from(extraFields!.map((x) => x)),
        "categories": categories!.toJson(),
        "chemical_combination": chemicalCombination,
        "date": date!.toIso8601String(),
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
  SubCategoryName? subCategoryName;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        categoryName: json["category_name"],
        subCategoryName: subCategoryNameValues.map[json["sub_category_name"]],
      );

  Map<String, dynamic> toJson() => {
        "category_name": categoryName,
        "sub_category_name": subCategoryNameValues.reverse[subCategoryName],
      };
}

enum SubCategoryName {
  SUPPOSITORIES,
  THE_6368_D5_E32_A9_C09_D50_DE42137,
  CREAMS
}

final subCategoryNameValues = EnumValues({
  "creams": SubCategoryName.CREAMS,
  "Suppositories": SubCategoryName.SUPPOSITORIES,
  "6368d5e32a9c09d50de42137": SubCategoryName.THE_6368_D5_E32_A9_C09_D50_DE42137
});

class DiscountDetails {
  DiscountDetails({
    this.status,
    this.type,
    this.finalPtr,
    this.bonus,
    this.perPtr,
    this.ptr,
    this.gst,
    this.gstValue,
    this.retailPercentage,
    this.finalUserBuy,
    this.finalOrderValue,
    this.message,
    this.discount,
    this.discountValue,
  });

  bool? status;
  Type? type;
  dynamic finalPtr;
  int? bonus;
  dynamic perPtr;
  dynamic ptr;
  dynamic gst;
  dynamic gstValue;
  dynamic retailPercentage;
  dynamic finalUserBuy;
  dynamic finalOrderValue;
  String? message;
  dynamic? discount;
  String? discountValue;

  factory DiscountDetails.fromJson(Map<String, dynamic> json) =>
      DiscountDetails(
        status: json["status"],
        type: typeValues.map[json["type"]],
        finalPtr: json["final_ptr"],
        bonus: json["bonus"] == null ? null : json["bonus"],
        perPtr: json["per_ptr"],
        ptr: json["ptr"],
        gst: json["gst"],
        gstValue: json["gst_value"],
        retailPercentage: json["retail_percentage"],
        finalUserBuy: json["final_user_buy"],
        finalOrderValue: json["final_order_value"],
        message: json["message"],
        discount: json["discount"],
        discountValue:
            json["discount_value"] == null ? null : json["discount_value"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "type": typeValues.reverse[type],
        "final_ptr": finalPtr,
        "bonus": bonus == null ? null : bonus,
        "per_ptr": perPtr,
        "ptr": ptr,
        "gst": gst,
        "gst_value": gstValue,
        "retail_percentage": retailPercentage,
        "final_user_buy": finalUserBuy,
        "final_order_value": finalOrderValue,
        "message": message,
        "discount": discount,
        "discount_value": discountValue == null ? null : discountValue,
      };
}

enum Type { SAME_PRODUCT_BONUS, PTR_DISCOUNT }

final typeValues = EnumValues({
  "ptr_discount": Type.PTR_DISCOUNT,
  "same_product_bonus": Type.SAME_PRODUCT_BONUS
});

class DiscountFormDetails {
  DiscountFormDetails({
    this.gstPercentage,
    this.discountFormDetailsGet,
    this.buy,
    this.mrp,
    this.minQtySale,
    this.maxQtySale,
    this.userBuy,
    this.discountOnPtrOnlyPercenatge,
    this.producName,
  });

  dynamic gstPercentage;
  dynamic discountFormDetailsGet;
  dynamic buy;
  dynamic mrp;
  dynamic minQtySale;
  dynamic maxQtySale;
  dynamic userBuy;
  dynamic discountOnPtrOnlyPercenatge;
  String? producName;

  factory DiscountFormDetails.fromJson(Map<String, dynamic> json) =>
      DiscountFormDetails(
        gstPercentage: json["gstPercentage"],
        discountFormDetailsGet: json["get"],
        buy: json["buy"],
        mrp: json["mrp"],
        minQtySale: json["minQtySale"],
        maxQtySale: json["maxQtySale"],
        userBuy: json["userBuy"],
        discountOnPtrOnlyPercenatge: json["discountOnPtrOnlyPercenatge"],
        producName: json["producName"] == null ? null : json["producName"],
      );

  Map<String, dynamic> toJson() => {
        "gstPercentage": gstPercentage,
        "get": discountFormDetailsGet,
        "buy": buy,
        "mrp": mrp,
        "minQtySale": minQtySale,
        "maxQtySale": maxQtySale,
        "userBuy": userBuy,
        "discountOnPtrOnlyPercenatge": discountOnPtrOnlyPercenatge,
        "producName": producName == null ? null : producName,
      };
}

class ExtraFieldClass {
  ExtraFieldClass({
    this.key,
    this.value,
  });

  String? key;
  String? value;

  factory ExtraFieldClass.fromJson(Map<String, dynamic> json) =>
      ExtraFieldClass(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}

enum SellerId {
  THE_636477702052_F42_B834_D3235,
  THE_635_FFB05_A04_EDCADE2_D5_B37_E,
  THE_62_D1422148_E674_B49_C833_DB2
}

final sellerIdValues = EnumValues({
  "62d1422148e674b49c833db2": SellerId.THE_62_D1422148_E674_B49_C833_DB2,
  "635ffb05a04edcade2d5b37e": SellerId.THE_635_FFB05_A04_EDCADE2_D5_B37_E,
  "636477702052f42b834d3235": SellerId.THE_636477702052_F42_B834_D3235
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
