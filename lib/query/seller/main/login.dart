import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pharma/query/seller/global.dart';

Future<LoginResponse?> sendOtpMethod(BuildContext context,
    {required LoginParams body}) async {
  print(body.phoneNo);
  try {
    var data = await SellerGlobalHandler.requestPost(
        '/seller/un/auth/phone', body.toJson());

    var jsonData = jsonDecode(data.body);
    LoginResponse response = LoginResponse.fromJson(jsonData);
    print(response.toJson());
    return response;
  } catch (e) {
    SellerGlobalHandler.snackBar(
        context: context, message: e.toString(), isError: true);
    return null;
  }
}

class LoginParams {
  String? phoneNo;
  String? country;

  LoginParams({this.phoneNo, this.country});

  LoginParams.fromJson(Map<String, dynamic> json) {
    phoneNo = json['phone_no'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_no'] = this.phoneNo;
    data['country'] = this.country;
    return data;
  }
}

class LoginResponse {
  int? status;
  String? message;
  int? otp;

  LoginResponse({this.status, this.message, this.otp});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['otp'] = this.otp;
    return data;
  }
}
