import 'package:flutter/cupertino.dart';

import '../view/buyer/home/model.dart';

class AddStockProvider extends ChangeNotifier {
  var selectedDiscountType = "";
  var medicineType = "";
  String category = "";
  var subCategory = "";
  var isBluk = false;

  TextEditingController productNameController = TextEditingController();
  TextEditingController productCompanyController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productStockController = TextEditingController();
  TextEditingController productCategoryController = TextEditingController();
  TextEditingController productChemimalController = TextEditingController();
  TextEditingController countryOfOriginController = TextEditingController();
  TextEditingController productMinOrderQtyController = TextEditingController();
  TextEditingController productMaxOrderQtyController = TextEditingController();
  TextEditingController productExpireController = TextEditingController();
  AllCategoriesModel? tabList;
  List<String> result = [];
  List<String> imageList = [];

  Map<String, dynamic> discountDetails = {};
  Map<String, dynamic> discountFormDetails = {};
  void setSelectedDiscountType(String value) {
    selectedDiscountType = value;
    notifyListeners();
  }

  void setMedicineType(String value) {
    medicineType = value;
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }

  void setCategory(String value) {
    category = value;
    // notifyListeners();
  }

  void setSubCategory(String value) {
    subCategory = value;
    // notifyListeners();
  }

  void setIsBluk(bool value) {
    isBluk = value;
    notifyListeners();
  }

  void addImage(String value) {
    imageList.add(value);
    notifyListeners();
  }

  void removeImage(int index) {
    imageList.removeAt(index);
    notifyListeners();
  }

  void setCategoryLoad() {
    tabList = AllCategoriesModel.fromJson(js);
  }

  void setDiscountDetails(Map<String, dynamic> value) {
    discountDetails = value;
    // notifyListeners();
  }

  void setDiscountFormDetails(Map<String, dynamic> value) {
    discountFormDetails = value;
    // notifyListeners();
  }

  void reset() {
    productNameController.text = "";
    productCompanyController.text = "";
    productPriceController.text = "";
    productStockController.text = "";
    productCategoryController.text = "";
    productChemimalController.text = "";
    countryOfOriginController.text = "";
    productMinOrderQtyController.text = "";
    productMaxOrderQtyController.text = "";
    productExpireController.text = "";
    imageList = [];
    discountDetails = {};
    discountFormDetails = {};
    selectedDiscountType = "";
    medicineType = "";
    category = "";
    subCategory = "";
    isBluk = false;
    notifyListeners();
  }
}
