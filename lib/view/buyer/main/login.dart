import 'package:flutter/material.dart';
import 'package:pharma/const.dart';
import 'package:pharma/query/buyer/global.dart';
import 'package:pharma/query/buyer/main/login.dart';
import 'package:pharma/view/buyer/main/verify.dart';
import 'package:pharma/view/new_buyer/home.dart';

// ignore: must_be_immutable
class BuyerLogin extends StatelessWidget {
  BuyerLogin({Key? key}) : super(key: key);
  TextEditingController phoneeNo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: blackColor,
        ),
        title: Text('Sign In', style: TextStyle(color: blackColor)),
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: primaryColor.withOpacity(0.1),
      ),
      // bottomNavigationBar: Container(
      //   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      //   color: Colors.white,
      //   height: 70,
      //   child: Column(
      //     children: [
      //       InkWell(
      //         onTap: () {
      //           Navigator.push(context, MaterialPageRoute(
      //             builder: (context) {
      //               return BuyerHome();
      //             },
      //           ));
      //           // sendOtpMethod(context,
      //           //     body: LoginParams(country: "", phoneNo: ""));
      //           // if (phoneeNo.text.length == 10) {
      //           //   buyerSendOtpMethod(context,
      //           //           body:
      //           //               LoginParams(country: "", phoneNo: phoneeNo.text))
      //           //       .then((value) {
      //           //     if (value!.status == 200) {
      //           //       BuyerGlobalHandler.snackBar(
      //           //           context: context,
      //           //           isSuccess: true,
      //           //           message: value.message!.toString());
      //           //       Navigator.push(
      //           //           context,
      //           //           MaterialPageRoute(
      //           //               builder: (context) => BuyerVerify(
      //           //                     phoneNo: phoneeNo.text,
      //           //                   )));
      //           //     } else {
      //           //       BuyerGlobalHandler.snackBar(
      //           //           context: context,
      //           //           isError: true,
      //           //           message: value.message!.toString());
      //           //     }
      //           //   });
      //           // } else {
      //           //   BuyerGlobalHandler.snackBar(
      //           //       context: context,
      //           //       isError: true,
      //           //       message: "Please enter 10 digit phone number");
      //           // }
      //         },
      //         child: Container(
      //           padding: EdgeInsets.all(10),
      //           width: double.infinity,
      //           decoration: BoxDecoration(
      //               color: primaryColor,
      //               borderRadius: BorderRadius.circular(10)),
      //           child: const Center(
      //             child: Text(
      //               'Sign In',
      //               style: TextStyle(color: Colors.white, fontSize: 18),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome back 👋",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: primaryColor)),
            Text(
                "Login with your stokist ID & password or use your resgistered number to login",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: greyColor)),
            SizedBox(
              height: 20,
            ),
            Text("Phone Number",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: primaryColor)),
            TextField(
              maxLength: 10,
              controller: phoneeNo,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter your Phone Number",
                hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: greyColor),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return BuyerHome(
                      isLoggedIn: true,
                    );
                  },
                ));
                // sendOtpMethod(context,
                //     body: LoginParams(country: "", phoneNo: ""));
                // if (phoneeNo.text.length == 10) {
                //   buyerSendOtpMethod(context,
                //           body:
                //               LoginParams(country: "", phoneNo: phoneeNo.text))
                //       .then((value) {
                //     if (value!.status == 200) {
                //       BuyerGlobalHandler.snackBar(
                //           context: context,
                //           isSuccess: true,
                //           message: value.message!.toString());
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => BuyerVerify(
                //                     phoneNo: phoneeNo.text,
                //                   )));
                //     } else {
                //       BuyerGlobalHandler.snackBar(
                //           context: context,
                //           isError: true,
                //           message: value.message!.toString());
                //     }
                //   });
                // } else {
                //   BuyerGlobalHandler.snackBar(
                //       context: context,
                //       isError: true,
                //       message: "Please enter 10 digit phone number");
                // }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return BuyerHome(
                      isLoggedIn: false,
                    );
                  },
                ));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'Skip',
                    style: TextStyle(color: blackColor, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
