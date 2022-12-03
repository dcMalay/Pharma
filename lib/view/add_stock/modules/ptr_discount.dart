var retailPercentage = 0.0;

num gstPercentage = 0;
num mrp = 0.0;
var minQtySale = 0;
var maxQtySale = 0;
var userBuy = 0;
num discountOnPtrOnlyPercenatge = 0.0;

class PtrOnlyModel {
  final num discountOnPtrOnlyPercenatge;
  final num gstPercentage;
  final num mrp;
  final int minQtySale;
  final int maxQtySale;
  final int userBuy;

  PtrOnlyModel(
      {required this.discountOnPtrOnlyPercenatge,
      required this.gstPercentage,
      required this.mrp,
      required this.minQtySale,
      required this.maxQtySale,
      required this.userBuy});

  Map<String, dynamic> toJson() => {
        'discountOnPtrOnlyPercenatge': discountOnPtrOnlyPercenatge,
        'gstPercentage': gstPercentage,
        'mrp': mrp,
        'minQtySale': minQtySale,
        'maxQtySale': maxQtySale,
        'userBuy': userBuy,
      };
}

Map<String, dynamic> discountOnPtrOnly(PtrOnlyModel data) {
  discountOnPtrOnlyPercenatge = data.discountOnPtrOnlyPercenatge;
  retailPercentage = gstRetailsPercentage(data.gstPercentage);

  gstPercentage = data.gstPercentage;
  mrp = data.mrp;
  minQtySale = data.minQtySale;
  maxQtySale = data.maxQtySale;
  userBuy = data.userBuy;
  if (maxQtySale > userBuy) {
    return {
      "status": false,
      "message": "maxQtySale should be less than " + maxQtySale.toString()
    };
  } else if (userBuy >= minQtySale) {
    var totalPtr = (mrp - (mrp * (retailPercentage / 100)));

    var prtDiscount = (discountOnPtrOnlyPercenatge / 100) * totalPtr;
    var ptrFaterDiscount = totalPtr - prtDiscount;

    var lastValue =
        ptrFaterDiscount + (ptrFaterDiscount * (gstPercentage / 100));

    return {
      "status": true,
      "type": "ptr_discount",
      "final_ptr": lastValue,
      "discount": discountOnPtrOnlyPercenatge,
      "ptr": totalPtr,
      "per_ptr": ptrFaterDiscount,
      "gst": gstPercentage,
      "gst_value": (ptrFaterDiscount * (gstPercentage / 100)),
      "retail_percentage": retailPercentage,
      "final_user_buy": userBuy,
      "final_order_value": (userBuy * lastValue),
      "message": "You have got " +
          discountOnPtrOnlyPercenatge.toString() +
          "% discount"
    };
  } else {
    return {
      "status": false,
      "message": "minQtySales should be greater than " + minQtySale.toString()
    };
  }
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
