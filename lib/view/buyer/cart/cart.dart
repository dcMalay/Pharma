import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharma/const.dart';
import 'package:pharma/provider/cart.dart';
import 'package:pharma/view/buyer/cart/components/cart_card.dart';
import 'package:pharma/view/buyer/home/home.dart';

class BuyerCart extends StatefulWidget {
  const BuyerCart({Key? key}) : super(key: key);

  @override
  State<BuyerCart> createState() => _BuyerCartState();
}

class _BuyerCartState extends State<BuyerCart> {
  @override
  void initState() {
    CartProviderCallBack(context).notListener.getCartMethodProvider(context);
    super.initState();
  }

  Future refreshController() async {
    CartProviderCallBack(context).notListener.getCartMethodProvider(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: primaryColor.withOpacity(0.1),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Bag",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refreshController,
        child: CartProviderCallBack(context).listener.cartValue == null
            ? Center(child: CircularProgressIndicator())
            : CartProviderCallBack(context)
                    .listener
                    .cartValue!
                    .resultCart!
                    .isEmpty
                ? Center(
                    child: Text("Cart is empty"),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      var ds = CartProviderCallBack(context)
                          .listener
                          .cartValue!
                          .resultCart![index];
                      return CartCard(ds: ds);
                    },
                    itemCount: CartProviderCallBack(context)
                        .listener
                        .cartValue!
                        .resultCart!
                        .length),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        height: 90,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Payable Amount".toUpperCase(),
                    style: TextStyle(color: greyColor, fontSize: 11),
                  ),
                  Text(
                    "₹ " +
                        CartProviderCallBack(context)
                            .listener
                            .cartValue!
                            .totalAmount
                            .toString(),
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            CartProviderCallBack(context).listener.cartValue!.isCheckedOut!
                ? Expanded(
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            builder: (context) {
                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: 80,
                                        height: 10,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                    Divider(),
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey.shade100),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: ListTile(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            title: Text("Cash On Delivery"),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey.shade100),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: ListTile(
                                            onTap: () async {
                                              Navigator.pop(context);
                                              await PaymentGateway()
                                                  .openPayment(
                                                      access_key:
                                                          CartProviderCallBack(
                                                                  context)
                                                              .notListener
                                                              .cartValue!
                                                              .paymentDetails!
                                                              .data!);
                                              refreshController();
                                            },
                                            title: Text("Online Payment"),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              );
                            });
                        // PaymentGateway().openPayment();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text("Checkout",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Center(
                                child: Text(
                                    CartProviderCallBack(context)
                                        .listener
                                        .cartValue!
                                        .message!,
                                    style: TextStyle(
                                        fontSize: 11, color: primaryColor)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return BuyerHomePage();
                                },
                              ));
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Center(
                                child: Text("Add More",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
          ],
        ),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 3,
          )
        ]),
      ),
    );
  }
}

class PaymentGateway {
  static MethodChannel _channel = MethodChannel('easebuzz');

  Future openPayment({required String access_key}) async {
    String pay_mode = "test";
    print(access_key);
    Object parameters = {"access_key": access_key, "pay_mode": pay_mode};
    final payment_response =
        await _channel.invokeMethod("payWithEasebuzz", parameters);
    print(payment_response);

/* payment_response is the HashMap containing the response of the payment.
You can parse it accordingly to handle response */
  }
}
