num retailPercentage = 0.0;
int buy = 0;
int get = 0;
num gstPercentage = 0;
num mrp = 0.0;
var minQtySale = 0;
var maxQtySale = 0;
var userBuy = 0;

class BonusModel {
  final num gstPercentage;
  final num mrp;
  final int minQtySale;
  final int maxQtySale;
  final int userBuy;
  final int get;
  final int buy;

  BonusModel(
      {required this.gstPercentage,
      required this.get,
      required this.buy,
      required this.mrp,
      required this.minQtySale,
      required this.maxQtySale,
      required this.userBuy});
  Map<String, dynamic> toJson() => {
        "gstPercentage": gstPercentage,
        "get": get,
        "buy": buy,
        "mrp": mrp,
        "minQtySale": minQtySale,
        "maxQtySale": maxQtySale,
        "userBuy": userBuy,
      };
}

Map<String, dynamic> bonus(BonusModel data) {
  retailPercentage = gstRetailsPercentage(data.gstPercentage);
  buy = data.buy;
  get = data.get;
  gstPercentage = data.gstPercentage;
  mrp = data.mrp;
  minQtySale = data.minQtySale;
  maxQtySale = data.maxQtySale;
  userBuy = data.userBuy;

  if (maxQtySale > userBuy) {
    return {
      "status": false,
      "message": "maxQtySale should be less than" + maxQtySale.toString()
    };
  } else if (userBuy >= minQtySale) {
    if (userBuy >= buy) {
      var discount = eligable(buy, get); // new chnagesd on 20-05-2020

      var totalPtr = (mrp - (mrp * (retailPercentage / 100)));

      num bonusDiscount = (discount * totalPtr / 100); // new line added

      num minusafterdiscount = totalPtr - bonusDiscount; // new line added
      num lastValue = minusafterdiscount +
          (minusafterdiscount * (gstPercentage / 100)); // changes

      return {
        "status": true,
        "type": "same_product_bonus",
        "final_ptr": lastValue,
        "bonus": bonusDiscount,
        "per_ptr": minusafterdiscount,
        "ptr": totalPtr,
        "gst": gstPercentage,
        "gst_value": bonusDiscount * (gstPercentage / 100),
        "retail_percentage": retailPercentage,
        "final_user_buy": userBuy + get,
        "final_order_value": (userBuy * lastValue),
        "message": "You have got " + get.toString() + "% bonus"
      };
    } else {
      // bcz user buy less than minQtySale

      var get = 0;

      var totalPtr = (mrp - (mrp * (retailPercentage / 100)));

      var lastValue = totalPtr + (totalPtr * (gstPercentage / 100));
      return {
        "status": true,
        "type": "same_product_bonus",
        "final_ptr": lastValue,
        "bonus": 0.0,
        "per_ptr": totalPtr,
        "ptr": totalPtr,
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

double eligable(int product, int bonusProduct) {
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
