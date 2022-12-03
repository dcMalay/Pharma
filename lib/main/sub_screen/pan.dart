import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pharma/const.dart';
import 'package:pharma/query/gst_pan.dart';
import 'package:pharma/query/seller/global.dart';

import '../create_account.dart';

TextEditingController _controller = TextEditingController();

class PanScreen extends StatelessWidget {
  final String phoneNumber;
  const PanScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // context.loaderOverlay.hide();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Text("Enter Pan number.", style: TextStyle(color: greyColor)),
          const SizedBox(
            height: 8,
          ),
          TextField(
            maxLength: 10,
            controller: _controller,
            decoration: InputDecoration(
              isDense: true,
              hintText: 'ABCDxxxxxx',
              hintStyle: TextStyle(color: greyColor, fontSize: 11),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: InkWell(
              onTap: () {
                if (_controller.text.length == 10) {
                  context.loaderOverlay.show();

                  getGstPanMethod(context,
                          userType: "seller",
                          body: GstPanParams(
                              gstNumber: "",
                              typeName: "PAN",
                              panNumber: _controller.text))
                      .then((value) {
                    if (value != null) {
                      context.loaderOverlay.hide();

                      if (value.status!) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return CreateAccount(
                              phoneNumber: phoneNumber,
                              gstPanResponse: value,
                            );
                          },
                        ));
                      } else {
                        SellerGlobalHandler.snackBar(
                            context: context,
                            message: value.message!.toString(),
                            isError: true);
                      }
                      // Navigator.pushNamed(context, '/gst_details');
                    } else {
                      context.loaderOverlay.hide();

                      SellerGlobalHandler.snackBar(
                          context: context,
                          message: "Something went wrong",
                          isError: true);
                    }
                  });
                } else {
                  SellerGlobalHandler.snackBar(
                      context: context,
                      message: "Please enter valid pan number",
                      isError: true);
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Continue",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 3,
                          spreadRadius: 1,
                          color: primaryColor.withOpacity(0.5))
                    ],
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
