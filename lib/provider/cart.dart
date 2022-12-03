import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pharma/components/button_chip.dart';
import 'package:pharma/const.dart';
import 'package:pharma/query/buyer/cart/add_cart.dart';
import 'package:pharma/query/buyer/cart/delete_cart.dart';
import 'package:pharma/query/buyer/cart/get_cart.dart';
import 'package:pharma/query/buyer/cart/update.dart';
import 'package:pharma/query/buyer/global.dart';
import 'package:pharma/view/buyer/main/login.dart';
import 'package:provider/provider.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CartProvider extends ChangeNotifier {
  GetCartResponse? cartValue;

  getCartMethodProvider(BuildContext context) {
    // context.loaderOverlay.show();

    try {
      getCartMethod(context).then((value) {
        // context.loaderOverlay.hide();
        if (value != null) {
          if (value.status == 401) {
            modelDialog(context);
          } else if (value.status == 200) {
            cartValue = value;
            notifyListeners();
          }
        } else {
          // context.loaderOverlay.hide();
        }
      });
    } catch (e) {
      // print(e);
      // context.loaderOverlay.hide();
    }
  }
}

class CartProviderCallBack {
  final BuildContext context;

  CartProviderCallBack(this.context);
  CartProvider get listener => Provider.of<CartProvider>(context, listen: true);
  CartProvider get notListener =>
      Provider.of<CartProvider>(context, listen: false);
  static addCart(BuildContext context, {ParamsCart? params}) {
    addCartMethod(context, body: params!).then((ds) {
      if (ds != null) {
        if (ds.status == 200) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // title: Text('Success'),
                  title: Text(ds.message!),
                  actions: <Widget>[
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        CartProviderCallBack(context)
                            .notListener
                            .getCartMethodProvider(context);
                        // Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
        } else {
          modelDialog(context);
          // notListener.changeScreen('Home');
        }
      }
    });
  }

  Future<bool?> delCart(String id) async {
    var value = await deleteCartMethod(context, id: id);
    if (value != null) {
      if (value.status == 200) {
        return true;
      } else {
        modelDialog(context);
        // notListener.changeScreen('Home');
      }
    }
    return true;
  }

  Future<bool?> updateCart(String id, String quantity) async {
    var value = await updateCartMethod(context, id: id, quantity: quantity);
    if (value != null) {
      if (value.status == 200) {
        BuyerGlobalHandler.snackBar(
            context: context, isSuccess: true, message: value.message!);
      } else {
        modelDialog(context);
        // notListener.changeScreen('Home');
      }
    }
    return true;
  }
}

void modelDialog(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 10,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30)),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: const Text(
                          "Login to Continue",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Please login first",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: customButton(
                    lable: "Login",
                    color: primaryColor,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return BuyerLogin();
                        },
                      ));
                    }),
              )
            ],
          ),
        );
      });
}
