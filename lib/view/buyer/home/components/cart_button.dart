import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pharma/const.dart';
import 'package:pharma/provider/cart.dart';
import 'package:pharma/view/buyer/cart/cart.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 7, top: 7),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return BuyerCart();
                },
              ));
            },
            child: Container(
              width: 40,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: primaryColor.withOpacity(0.1)),
              child: Center(
                child: Icon(
                  Icons.shopping_cart,
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ),
        CartProviderCallBack(context).listener.cartValue == null
            ? Container()
            : CartProviderCallBack(context)
                    .listener
                    .cartValue!
                    .resultCart!
                    .isEmpty
                ? Container()
                : Positioned(
                    left: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 8,
                      child: Text(
                        CartProviderCallBack(context)
                            .listener
                            .cartValue!
                            .resultCart!
                            .length
                            .toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    ),
                  )
      ],
    );
  }
}
