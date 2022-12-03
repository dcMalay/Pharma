import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pharma/query/buyer/global.dart';

Future<VerifyResponse?> buyerVerifyOtpMethod(BuildContext context,
    {required VerifyParams body}) async {
  try {
    // print(body.toJson());
    var data = await BuyerGlobalHandler.requestPost(
        '/buyer/un/auth/verify', body.toJson());
    var jsonData = jsonDecode(data.body);
    VerifyResponse response = VerifyResponse.fromJson(jsonData);
    // print(response.toJson());
    return response;
  } catch (e) {
    return null;
  }
}

class VerifyParams {
  String? phoneNo;
  String? otp;
  String? country;

  VerifyParams({this.phoneNo, this.otp, this.country});

  VerifyParams.fromJson(Map<String, dynamic> json) {
    phoneNo = json['phone_no'];
    otp = json['otp'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_no'] = phoneNo;
    data['otp'] = otp;
    data['country'] = country;
    return data;
  }
}

class VerifyResponse {
  int? status;
  String? authToken;
  int? isUserFound;
  String? message;
  VerifyResponse({this.status, this.authToken, this.isUserFound});

  VerifyResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    authToken = json['auth-token'];
    isUserFound = json['is_user_found'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['auth-token'] = authToken;
    data['is_user_found'] = isUserFound;
    data['message'] = message;
    return data;
  }
}
