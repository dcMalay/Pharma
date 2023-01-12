import 'package:flutter/material.dart';
import 'package:pharma/callback_provider/buyer.dart';
import 'package:pharma/main/login.dart';
import 'package:pharma/query/buyer/global.dart';
import 'package:pharma/query/seller/global.dart';
import 'package:pharma/view/buyer/home/home.dart';
import 'package:pharma/view/buyer/main/login.dart';
import 'package:pharma/view/onboarding/welcome.dart';
import '../view/new_buyer/home.dart';



class BuyerLoginCallBack {
  static Future<void> onChechkingAccount(context) async {
    var isLogged = await BuyerGlobalHandler.checkLogedin();

    if (isLogged) {
      var token = await BuyerGlobalHandler.getToken();
      print(token);
      if (token != null) {
        await BuyerCallBack(context)
            .buyerProviderWithoutLisner
            .getUser(context);
        if (BuyerCallBack(context).getBuyDetails != null) {
          if (BuyerCallBack(context).getBuyDetails!.isAccountFound! == true) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return BuyerHome(
                isLoggedIn: true,
              );
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
        BuyerLoginCallBack().onCheckAccountBuyer(context);
      }
    } else {
      BuyerLoginCallBack().onCheckAccountBuyer(context);
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
            BuyerGlobalHandler.snackBar(
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
