import 'package:flutter/material.dart';
import 'package:pharma/const.dart';
import 'package:pharma/main/sub_screen/gst.dart';
import 'package:pharma/main/sub_screen/pan.dart';

import 'subscreen/buyer_gst.dart';
import 'subscreen/buyer_pan.dart';

class BuyerSignUp extends StatelessWidget {
  final String phoneNumber;

  const BuyerSignUp({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Sign Up', style: TextStyle(color: blackColor)),
          centerTitle: true,
          backgroundColor: Colors.white,
          // elevation: 0.0,
          shadowColor: primaryColor.withOpacity(0.1),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Quick Sign Up",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Center(
                child: Text(
              "Enter your details PAN or GST to sign up",
              style: TextStyle(color: greyColor),
            )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      spreadRadius: 2,
                      color: primaryColor.withOpacity(0.1),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: primaryColor,
                    indicator: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    tabs: [
                      Tab(
                        icon: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Icons.dashboard_customize_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Text("PAN"),
                          ],
                        ),
                      ),
                      Tab(
                        icon: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Icons.dashboard_customize_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Text("GST"),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
            Expanded(
                child: TabBarView(children: [
              BuyerPanScreen(
                phoneNumber: phoneNumber,
              ),
              BuyerGstScreen(
                phoneNumber: phoneNumber,
              )
            ]))
          ],
        ),
      ),
    );
  }
}
