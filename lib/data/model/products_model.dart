class ProductModel {
  ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        sellerId: sellerIdValues.map[json["seller_id"]]!,
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
    this.discountValue,
    this.ptr,
    this.perPtr,
    this.gst,
    this.gstValue,
    this.retailPercentage,
    this.finalUserBuy,
    this.finalOrderValue,
    this.message,
    this.bonus,
    this.bonusGet,
    this.productName,
  });

  bool? status;
  Type? type;
  dynamic finalPtr;
  dynamic discount;
  String? discountValue;
  dynamic ptr;
  dynamic perPtr;
  dynamic gst;
  dynamic gstValue;
  dynamic retailPercentage;
  dynamic finalUserBuy;
  dynamic finalOrderValue;
  String? message;
  dynamic bonus;
  String? bonusGet;
  String? productName;

  factory DiscountDetails.fromJson(Map<String, dynamic> json) =>
      DiscountDetails(
        status: json["status"],
        type: typeValues.map[json["type"]]!,
        finalPtr: json["final_ptr"],
        discount: json["discount"],
        discountValue:
            json["discount_value"] == null ? null : json["discount_value"],
        ptr: json["ptr"],
        perPtr: json["per_ptr"],
        gst: json["gst"],
        gstValue: json["gst_value"],
        retailPercentage: json["retail_percentage"],
        finalUserBuy: json["final_user_buy"],
        finalOrderValue: json["final_order_value"],
        message: json["message"],
        bonus: json["bonus"],
        bonusGet: json["bonus_get"] == null ? null : json["bonus_get"],
        productName: json["product_name"] == null ? null : json["product_name"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "type": typeValues.reverse[type],
        "final_ptr": finalPtr,
        "discount": discount,
        "discount_value": discountValue == null ? null : discountValue,
        "ptr": ptr,
        "per_ptr": perPtr,
        "gst": gst,
        "gst_value": gstValue,
        "retail_percentage": retailPercentage,
        "final_user_buy": finalUserBuy,
        "final_order_value": finalOrderValue,
        "message": message,
        "bonus": bonus,
        "bonus_get": bonusGet == null ? null : bonusGet,
        "product_name": productName == null ? null : productName,
      };
}

enum Type {
  PTR_DISCOUNT,
  DIFFERENT_PTR_DISCOUNT_AND_SAME_PRODUCT_BONUS,
  SAME_PRODUCT_BONUS
}

final typeValues = EnumValues({
  "different_ptr_discount_and_same_product_bonus":
      Type.DIFFERENT_PTR_DISCOUNT_AND_SAME_PRODUCT_BONUS,
  "ptr_discount": Type.PTR_DISCOUNT,
  "same_product_bonus": Type.SAME_PRODUCT_BONUS
});

class DiscountFormDetails {
  DiscountFormDetails({
    this.gstPercentage,
    this.mrp,
    this.buy,
    this.discountFormDetailsGet,
    this.producName,
    this.maxQtySale,
    this.minQtySale,
    this.discountOnPtrOnlyPercenatge,
    this.userBuy,
  });

  dynamic gstPercentage;
  dynamic mrp;
  dynamic buy;
  dynamic discountFormDetailsGet;
  String? producName;
  dynamic maxQtySale;
  dynamic minQtySale;
  dynamic discountOnPtrOnlyPercenatge;
  dynamic userBuy;

  factory DiscountFormDetails.fromJson(Map<String, dynamic> json) =>
      DiscountFormDetails(
        gstPercentage: json["gstPercentage"],
        mrp: json["mrp"],
        buy: json["buy"],
        discountFormDetailsGet: json["get"],
        producName: json["producName"] == null ? null : json["producName"],
        maxQtySale: json["maxQtySale"],
        minQtySale: json["minQtySale"],
        discountOnPtrOnlyPercenatge: json["discountOnPtrOnlyPercenatge"],
        userBuy: json["userBuy"],
      );

  Map<String, dynamic> toJson() => {
        "gstPercentage": gstPercentage,
        "mrp": mrp,
        "buy": buy,
        "get": discountFormDetailsGet,
        "producName": producName == null ? null : producName,
        "maxQtySale": maxQtySale,
        "minQtySale": minQtySale,
        "discountOnPtrOnlyPercenatge": discountOnPtrOnlyPercenatge,
        "userBuy": userBuy,
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
  THE_635_FFB05_A04_EDCADE2_D5_B37_E,
  THE_636477702052_F42_B834_D3235
}

final sellerIdValues = EnumValues({
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
