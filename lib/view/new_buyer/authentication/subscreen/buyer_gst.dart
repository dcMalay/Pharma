import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pharma/const.dart';
import '../../../../query/buyer/global.dart';
import '../../../../query/gst_pan.dart';

import '../create_buyer_account.dart';

TextEditingController _controller = TextEditingController();

class BuyerGstScreen extends StatelessWidget {
  final String phoneNumber;

  const BuyerGstScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Text("Enter Gst number.", style: TextStyle(color: greyColor)),
          const SizedBox(
            height: 8,
          ),
          TextField(
            maxLength: 15,
            controller: _controller,
            decoration: InputDecoration(
              isDense: true,
              hintText: '37AAAxxxxxxxxxx',
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
                if (_controller.text.length == 15) {
                  context.loaderOverlay.show();

                  getGstPanMethod(context, 'GST', _controller.text)
                      .then((value) {
                    if (value != null) {
                      context.loaderOverlay.hide();
                      print("data send to createaccount page--->${value}");
                      if (value.data != null) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return CreateBuyerAccount(
                              phoneNumber: phoneNumber,
                              gstPanResponse: value,
                              type: 'GST',
                            );
                          },
                        ));
                      } else {
                        BuyerGlobalHandler.snackBar(
                            context: context,
                            message: value.message!.toString(),
                            isError: true);
                      }
                    } else {
                      context.loaderOverlay.hide();

                      BuyerGlobalHandler.snackBar(
                          context: context,
                          message: "Something went wrong",
                          isError: true);
                    }
                  });
                } else {
                  BuyerGlobalHandler.snackBar(
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
