import 'package:flutter/cupertino.dart';
import 'package:pharma/query/buyer/main/get_details.dart';

class BuyerProvider extends ChangeNotifier {
  GetBuyerDetails? getSellerDetails;
  Future getUser(BuildContext context) async {
    var ds = await getBuyerDetailsMethod(context);
    getSellerDetails = ds;
    notifyListeners();
  }
}
