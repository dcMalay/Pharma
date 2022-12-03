import 'package:flutter/material.dart';
import 'package:pharma/const.dart';
import 'package:pharma/main/verify.dart';
import 'package:pharma/query/seller/global.dart';
import 'package:pharma/query/seller/main/login.dart';
import '../view/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneeNo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: blackColor,
        ),
        title: Text('Sign In', style: TextStyle(color: Colors.grey[400])),
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: primaryColor.withOpacity(0.1),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        color: Colors.white,
        height: 75,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const Home();
                }));
                // if (phoneeNo.text.length == 10) {
                //   print('otp button tapped ');
                //   sendOtpMethod(context,
                //           body:
                //               LoginParams(country: "", phoneNo: phoneeNo.text))
                //       .then((value) {
                //     if (value!.status == 200) {
                //       print('otp button tapped ${value.otp}');
                //       SellerGlobalHandler.snackBar(
                //           context: context,
                //           isSuccess: true,
                //           message: value.message!.toString());
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => Verify(
                //                     phoneNo: phoneeNo.text,
                //                   )));
                //     } else {
                //       SellerGlobalHandler.snackBar(
                //           context: context,
                //           isError: true,
                //           message: value.message!.toString());
                //     }
                //   });
                // } else {
                //   SellerGlobalHandler.snackBar(
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
            // const SizedBox(height: 10),
            // Center(
            //   child: Text("Sign up as a seller",
            //       style: TextStyle(
            //           color: primaryColor,
            //           fontSize: 16,
            //           decoration: TextDecoration.underline,
            //           fontWeight: FontWeight.w500)),
            // ),
          ],
        ),
      ),
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
              controller: phoneeNo,
              keyboardType: TextInputType.phone,
              maxLength: 10,
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
          ],
        ),
      ),
    );
  }
}
