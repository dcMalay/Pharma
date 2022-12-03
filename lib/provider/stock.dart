import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pharma/query/seller/product/get_user_products_by_search.dart';
import 'package:pharma/query/seller/product/get_user_products.dart';

class StockProvider extends ChangeNotifier {
  GetProductsModel? dsValue;
  List<ResultProducts>? products = [];

  getStockProvider(BuildContext context) {
    context.loaderOverlay.show();

    getProductMethod(context).then((value) {
      dsValue = value;

      products = value!.resultProducts;
      context.loaderOverlay.hide();

      notifyListeners();
    });
  }

  searchStock(context, String q) {
    getProductSearchMethod(context, q: q).then((value) {
      dsValue = value;
      // products = value;

      notifyListeners();
    });
    // notifyListeners();
  }
}
