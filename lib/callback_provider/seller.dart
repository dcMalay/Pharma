import 'package:flutter/material.dart';
import 'package:pharma/provider/seller.dart';
import 'package:pharma/query/seller/get_details.dart';
import 'package:provider/provider.dart';

class SellerCallBack {
  final BuildContext context;

  SellerCallBack(this.context);

  SellerProvider get sellerProvider => Provider.of<SellerProvider>(context);
  SellerProvider get sellerProviderWithoutLisner =>
      Provider.of<SellerProvider>(context, listen: false);
  GetSellerDetails? get getSellerDetails =>
      Provider.of<SellerProvider>(context, listen: false).getSellerDetails;
}
