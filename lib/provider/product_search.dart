import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pharma/query/buyer/products/get_user_products_by_search.dart';
import 'package:pharma/query/seller/product/get_user_products.dart';

class BuyerProductProvider extends ChangeNotifier {
  GetProductsModel? dsValue;
  List<ResultProducts>? products = [];

  searchStock(context, String q) {
    buyerGetProductSearchMethod(context, q: q).then((value) {
      dsValue = value;
      // products = value;

      notifyListeners();
    });
    // notifyListeners();
  }

  searchStockWithcategory(context, String q, ParamsCategoryProducts params) {
    buyerGetProductSearchWithCategoryMethod(context, q: q, params: params)
        .then((value) {
      dsValue = value;
      // products = value;

      notifyListeners();
    });
    // notifyListeners();
  }
}
