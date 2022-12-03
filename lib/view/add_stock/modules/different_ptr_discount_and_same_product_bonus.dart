num retailPercentage = 0.0;
var buy = 0;
var get = 0;
num gstPercentage = 0;
num mrp = 0.0;
var minQtySale = 0;
var maxQtySale = 0;
var userBuy = 0;
num discountOnPtrOnlyPercenatge = 0.0;
String? producName;

class DifferentSameBonusPtrOnlyModel {
  final num discountOnPtrOnlyPercenatge;
  final num gstPercentage;
  final num mrp;
  final int minQtySale;
  final int maxQtySale;
  final int userBuy;
  final int get;
  final int buy;
  final String producName;

  DifferentSameBonusPtrOnlyModel(
      {required this.discountOnPtrOnlyPercenatge,
      required this.producName,
      required this.gstPercentage,
      required this.mrp,
      required this.get,
      required this.buy,
      required this.minQtySale,
      required this.maxQtySale,
      required this.userBuy});
  Map<String, dynamic> toJson() => {
        "discountOnPtrOnlyPercenatge": discountOnPtrOnlyPercenatge,
        "producName": producName,
        "gstPercentage": gstPercentage,
        "mrp": mrp,
        "get": get,
        "buy": buy,
        "minQtySale": minQtySale,
        "maxQtySale": maxQtySale,
        "userBuy": userBuy,
      };
}

Map<String, dynamic> differentptrDicountProductsBonus(
    DifferentSameBonusPtrOnlyModel data) {
  discountOnPtrOnlyPercenatge = data.discountOnPtrOnlyPercenatge;

  retailPercentage = gstRetailsPercentage(data.gstPercentage);

  buy = data.buy;
  get = data.get;
  gstPercentage = data.gstPercentage;
  mrp = data.mrp;
  minQtySale = data.minQtySale;
  maxQtySale = data.maxQtySale;
  userBuy = data.userBuy;
  producName = data.producName;
  if (maxQtySale > userBuy) {
    return {
      "status": false,
      "message": "maxQtySale should be less than" + maxQtySale.toString()
    };
  } else if (userBuy >= minQtySale) {
    if (userBuy >= buy) {
      var totalPtr = (mrp - (mrp * (retailPercentage / 100)));
      var prtDiscount = (discountOnPtrOnlyPercenatge / 100) * totalPtr;
      var ptrFaterDiscount = totalPtr - prtDiscount;
      var bonusDiscount = ptrFaterDiscount;
      var lastValue = bonusDiscount + (bonusDiscount * (gstPercentage / 100));
      return {
        "status": true,
        "type": "different_ptr_discount_and_same_product_bonus",
        "final_ptr": lastValue,
        "bonus": bonusDiscount,
        "ptr": totalPtr,
        "per_ptr": bonusDiscount,
        "gst": gstPercentage,
        "gst_value": bonusDiscount * (gstPercentage / 100),
        "retail_percentage": retailPercentage,
        "final_user_buy": userBuy,
        "bonus_get": get,
        "final_order_value": (userBuy * lastValue),
        "product_name": producName,
        "message": "You have got " + get.toString() + "% bonus"
      };
    } else {
      // bcz user buy less than minQtySale

      var get = 0;
      var totalPtr = (mrp - (mrp * (retailPercentage / 100)));

      var lastValue = totalPtr + (totalPtr * (gstPercentage / 100));
      return {
        "status": true,
        "type": "different_ptr_discount_and_same_product_bonus",
        "final_ptr": lastValue,
        "bonus": 0.0,
        "ptr": totalPtr,
        "per_ptr": totalPtr,
        "gst": gstPercentage,
        "gst_value": totalPtr * (gstPercentage / 100),
        "retail_percentage": retailPercentage,
        "final_user_buy": userBuy + get,
        "final_order_value": (userBuy * lastValue),
        "message": "You have got " + get.toString() + "% bonus"
      };
    }
  } else {
    return {
      "status": false,
      "message": "minQtySales should be greater than " + minQtySale.toString()
    };
  }
}

eligable(product, bonusProduct) {
  var totalProduct = product + bonusProduct;
  var bonusDivide = bonusProduct / totalProduct;
  var bonus = bonusDivide * 100;

  return bonus;
}

double gstRetailsPercentage(gstValue) {
  if (gstValue == 0) {
    return 0;
  } else if (gstValue == 5) {
    return 23.80;
  } else if (gstValue == 12) {
    return 28.57;
  } else if (gstValue == 18) {
    return 32.20;
  } else {
    return 0;
  }
}
