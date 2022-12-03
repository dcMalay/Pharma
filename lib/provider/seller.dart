import 'package:flutter/cupertino.dart';
import 'package:pharma/query/seller/get_details.dart';

class SellerProvider extends ChangeNotifier {
  GetSellerDetails? getSellerDetails;
  Future getUser(BuildContext context) async {
    var ds = await getSellerDetailsMethod(context);
    getSellerDetails = ds;
    notifyListeners();
  }
}
