import 'package:flutter/material.dart';
import 'package:pharma/const.dart';
import 'package:pharma/main/sign_up.dart';
import 'package:pharma/query/seller/global.dart';
import 'package:pharma/query/seller/main/login.dart';
import 'package:pharma/query/seller/main/verify.dart';
import 'package:pharma/view/home.dart';

import '../../../query/buyer/global.dart';
import '../home.dart';
import 'buyer_signup.dart';

class BuyerVerify extends StatefulWidget {
  final String phoneNo;
  const BuyerVerify({Key? key, required this.phoneNo}) : super(key: key);

  @override
  State<BuyerVerify> createState() => _BuyerVerifyState();
}

class _BuyerVerifyState extends State<BuyerVerify> {
  TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: blackColor,
        ),
        title: Text('Verify', style: TextStyle(color: blackColor)),
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: primaryColor.withOpacity(0.1),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        color: Colors.white,
        height: 120,
        child: Column(
          children: [
            InkWell(
              onTap: () async {
                var res = await verifybuyerOtpMethod(context,
                    body: VerifyParams(
                        country: '', otp: otp.text, phoneNo: widget.phoneNo));
                if (res != null) {
                  if (res.status == 200) {
                    if (res.isUserFound == 1) {
                      BuyerGlobalHandler.setToken(res.authToken!);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return BuyerHome(
                          isLoggedIn: true,
                        );
                      }));
                    } else {
                      BuyerGlobalHandler.setToken(res.authToken!);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return BuyerSignUp(
                          phoneNumber: widget.phoneNo,
                        );
                      }));
                    }
                  } else {
                    BuyerGlobalHandler.snackBar(
                        context: context, message: res.message!, isError: true);
                  }
                } else {
                  BuyerGlobalHandler.snackBar(
                      context: context,
                      message: "Internal Problem",
                      isError: true);
                }
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
            const SizedBox(height: 10),
            Center(
              child: InkWell(
                onTap: () {
                  if (widget.phoneNo.length == 10) {
                    sendOtpMethod(context,
                            body: LoginParams(
                                country: "", phoneNo: widget.phoneNo))
                        .then((value) {
                      if (value!.status == 200) {
                        BuyerGlobalHandler.snackBar(
                            context: context,
                            isSuccess: true,
                            message: value.message!.toString());
                      } else {
                        BuyerGlobalHandler.snackBar(
                            context: context,
                            isError: true,
                            message: value.message!.toString());
                      }
                    });
                  } else {
                    BuyerGlobalHandler.snackBar(
                        context: context,
                        isError: true,
                        message: "Please enter 10 digit phone number");
                  }
                },
                child: Text("Resend OTP",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Verify Your Account",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: primaryColor)),
            Text(
                "Enter the OTP sent to your register mobile number \n+91 ${widget.phoneNo}",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: greyColor)),
            SizedBox(
              height: 20,
            ),
            Text("One Time Password",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: primaryColor)),
            TextField(
              controller: otp,
              maxLength: 6,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter 6 digit OTP",
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
          ],
        ),
      ),
    );
  }
}
