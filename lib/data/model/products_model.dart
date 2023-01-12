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

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        sellerId: json["seller_id"],
        imageList: json["image_list"][0],
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
      );
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
}
