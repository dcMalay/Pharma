

class ProductsDetailsModel {
  ProductsDetailsModel({
    this.status,
    this.message,
    this.resultProducts,
  });

  int? status;
  String? message;
  ResultProducts? resultProducts;

  factory ProductsDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductsDetailsModel(
        status: json["status"],
        message: json["message"],
        resultProducts: ResultProducts.fromJson(json["result_products"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result_products": resultProducts!.toJson(),
      };
}

class ResultProducts {
  ResultProducts({
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
  List<String>? extraFields;
  Categories? categories;
  String? chemicalCombination;
  DateTime? date;
  int? status;
  int? v;

  factory ResultProducts.fromJson(Map<String, dynamic> json) => ResultProducts(
        id: json["_id"],
        sellerId: json["seller_id"],
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
        extraFields: List<String>.from(json["extra_fields"].map((x) => x)),
        categories: Categories.fromJson(json["categories"]),
        chemicalCombination: json["chemical_combination"],
        date: DateTime.parse(json["date"]),
        status: json["status"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "seller_id": sellerId,
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
  });

  bool? status;
  String? type;
  String? finalPtr;
  String? discount;
  String? discountValue;
  String? ptr;
  String? perPtr;
  String? gst;
  String? gstValue;
  String? retailPercentage;
  String? finalUserBuy;
  String? finalOrderValue;
  String? message;

  factory DiscountDetails.fromJson(Map<String, dynamic> json) =>
      DiscountDetails(
        status: json["status"],
        type: json["type"],
        finalPtr: json["final_ptr"],
        discount: json["discount"],
        discountValue: json["discount_value"],
        ptr: json["ptr"],
        perPtr: json["per_ptr"],
        gst: json["gst"],
        gstValue: json["gst_value"],
        retailPercentage: json["retail_percentage"],
        finalUserBuy: json["final_user_buy"],
        finalOrderValue: json["final_order_value"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "type": type,
        "final_ptr": finalPtr,
        "discount": discount,
        "discount_value": discountValue,
        "ptr": ptr,
        "per_ptr": perPtr,
        "gst": gst,
        "gst_value": gstValue,
        "retail_percentage": retailPercentage,
        "final_user_buy": finalUserBuy,
        "final_order_value": finalOrderValue,
        "message": message,
      };
}

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

  String? gstPercentage;
  String? mrp;
  String? buy;
  String? discountFormDetailsGet;
  String? producName;
  String? maxQtySale;
  String? minQtySale;
  String? discountOnPtrOnlyPercenatge;
  String? userBuy;

  factory DiscountFormDetails.fromJson(Map<String, dynamic> json) =>
      DiscountFormDetails(
        gstPercentage: json["gstPercentage"],
        mrp: json["mrp"],
        buy: json["buy"],
        discountFormDetailsGet: json["get"],
        producName: json["producName"],
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
        "producName": producName,
        "maxQtySale": maxQtySale,
        "minQtySale": minQtySale,
        "discountOnPtrOnlyPercenatge": discountOnPtrOnlyPercenatge,
        "userBuy": userBuy,
      };
}
