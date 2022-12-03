import 'package:flutter/material.dart';
import 'package:pharma/callback_provider/buyer.dart';
import 'package:pharma/callback_provider/seller.dart';
import 'package:pharma/main/login.dart';
import 'package:pharma/query/buyer/global.dart';
import 'package:pharma/query/seller/global.dart';
import 'package:pharma/view/buyer/home/home.dart';
import 'package:pharma/view/buyer/main/login.dart';
import 'package:pharma/view/home.dart';
import 'package:pharma/view/onboarding/welcome.dart';

class SellerLoginCallBack {
  static Future<void> onChechkingAccount(context) async {
    var isLogged = await SellerGlobalHandler.checkLogedin();

    if (isLogged) {
      var token = await SellerGlobalHandler.getToken();
      print(token);
      if (token != null) {
        await SellerCallBack(context)
            .sellerProviderWithoutLisner
            .getUser(context);
        if (SellerCallBack(context).getSellerDetails != null) {
          if (SellerCallBack(context).getSellerDetails!.isAccountFound! ==
              true) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const Home();
            }));
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const Login();
            }));
          }
        } else {
          SellerGlobalHandler.snackBar(
              context: context, message: "Session Expire", isWarning: true);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const Login();
          }));
        }
      } else {
        SellerLoginCallBack().onCheckAccountBuyer(context);
      }
    } else {
      SellerLoginCallBack().onCheckAccountBuyer(context);
    }
  }

  Future onCheckAccountBuyer(BuildContext context) async {
    try {
      var buyerIsLogged = await BuyerGlobalHandler.checkLogedin();
      if (buyerIsLogged) {
        var buyerToken = await BuyerGlobalHandler.getToken();
        if (buyerToken != null) {
          await BuyerCallBack(context)
              .buyerProviderWithoutLisner
              .getUser(context);
          if (BuyerCallBack(context).getBuyDetails != null) {
            if (BuyerCallBack(context).getBuyDetails!.isAccountFound! == true) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const BuyerHomePage();
              }));
            } else {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return BuyerLogin();
              }));
            }
          } else {
            SellerGlobalHandler.snackBar(
                context: context, message: "Session Expire", isWarning: true);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return BuyerLogin();
            }));
          }
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const WelcomePage();
          }));
        }
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const WelcomePage();
        }));
      }
    } catch (e) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const WelcomePage();
      }));
    }
  }
}
