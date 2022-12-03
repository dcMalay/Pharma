import 'package:flutter/cupertino.dart';
import 'package:pharma/provider/stock.dart';
import 'package:provider/provider.dart';

class StockCallBack {
  final BuildContext context;

  StockCallBack(this.context);

  StockProvider get stockProvider => Provider.of<StockProvider>(context);
  StockProvider get withOutstockProvider =>
      Provider.of<StockProvider>(context, listen: false);
}
