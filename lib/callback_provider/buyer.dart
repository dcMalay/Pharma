import 'package:flutter/material.dart';
import 'package:pharma/provider/buyer.dart';
import 'package:provider/provider.dart';

import '../query/buyer/main/get_details.dart';

class BuyerCallBack {
  final BuildContext context;

  BuyerCallBack(this.context);

  BuyerProvider get buyerProvider => Provider.of<BuyerProvider>(context);
  BuyerProvider get buyerProviderWithoutLisner =>
      Provider.of<BuyerProvider>(context, listen: false);
  GetBuyerDetails? get getBuyDetails =>
      Provider.of<BuyerProvider>(context, listen: false).getSellerDetails;
}
