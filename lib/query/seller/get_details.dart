import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pharma/query/seller/global.dart';

Future<GetSellerDetails?> getSellerDetailsMethod(BuildContext context) async {
  try {
    var data = await SellerGlobalHandler.requestGet('/seller/auth/profile');

    var jsonData = jsonDecode(data.body);

    GetSellerDetails response = GetSellerDetails.fromJson(jsonData);
    return response;
  } catch (e) {
    context.loaderOverlay.hide();

    SellerGlobalHandler.snackBar(
        context: context, message: e.toString(), isError: true);
    return null;
  }
}

class GetSellerDetails {
  int? status;
  String? message;
  SellerUser? sellerUser;
  SellerDetails? sellerDetails;
  bool? isAccountFound;

  GetSellerDetails(
      {this.status,
      this.message,
      this.sellerUser,
      this.sellerDetails,
      this.isAccountFound});

  GetSellerDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    sellerUser = json['seller_user'] != null
        ? new SellerUser.fromJson(json['seller_user'])
        : null;
    sellerDetails = json['seller_details'] != null
        ? new SellerDetails.fromJson(json['seller_details'])
        : null;
    isAccountFound = json['is_account_found'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.sellerUser != null) {
      data['seller_user'] = this.sellerUser!.toJson();
    }
    if (this.sellerDetails != null) {
      data['seller_details'] = this.sellerDetails!.toJson();
    }
    data['is_account_found'] = this.isAccountFound;
    return data;
  }
}

class SellerUser {
  String? sId;
  int? phoneNo;
  String? password;
  String? expirePassword;
  String? dateTime;
  String? message;
  bool? isUserBlock;
  int? status;
  int? iV;

  SellerUser(
      {this.sId,
      this.phoneNo,
      this.password,
      this.expirePassword,
      this.dateTime,
      this.message,
      this.isUserBlock,
      this.status,
      this.iV});

  SellerUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phoneNo = json['phone_no'];
    password = json['password'];
    expirePassword = json['expire_password'];
    dateTime = json['date_time'];
    message = json['message'];
    isUserBlock = json['is_user_block'];
    status = json['status'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['phone_no'] = this.phoneNo;
    data['password'] = this.password;
    data['expire_password'] = this.expirePassword;
    data['date_time'] = this.dateTime;
    data['message'] = this.message;
    data['is_user_block'] = this.isUserBlock;
    data['status'] = this.status;
    data['__v'] = this.iV;
    return data;
  }
}

class SellerDetails {
  String? sId;
  String? sellerId;
  String? name;
  String? email;
  String? legalName;
  BankAccount? bankAccount;
  Licence? licence;
  Address? address;
  GstPanResponse? gstPanResponse;
  int? phoneNo;
  String? inviteCode;
  String? date;
  int? status;
  int? sellerNumberId;
  int? iV;

  SellerDetails(
      {this.sId,
      this.sellerId,
      this.name,
      this.email,
      this.legalName,
      this.bankAccount,
      this.licence,
      this.address,
      this.gstPanResponse,
      this.phoneNo,
      this.inviteCode,
      this.date,
      this.status,
      this.sellerNumberId,
      this.iV});

  SellerDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sellerId = json['seller_id'];
    name = json['name'];
    email = json['email'];
    legalName = json['legal_name'];
    bankAccount = json['bank_account'] != null
        ? new BankAccount.fromJson(json['bank_account'])
        : null;
    licence =
        json['licence'] != null ? new Licence.fromJson(json['licence']) : null;
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    gstPanResponse = json['gst_pan_response'] != null
        ? new GstPanResponse.fromJson(json['gst_pan_response'])
        : null;
    phoneNo = json['phone_no'];
    inviteCode = json['invite_code'];
    date = json['date'];
    status = json['status'];
    sellerNumberId = json['seller_number_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['seller_id'] = this.sellerId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['legal_name'] = this.legalName;
    if (this.bankAccount != null) {
      data['bank_account'] = this.bankAccount!.toJson();
    }
    if (this.licence != null) {
      data['licence'] = this.licence!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.gstPanResponse != null) {
      data['gst_pan_response'] = this.gstPanResponse!.toJson();
    }
    data['phone_no'] = this.phoneNo;
    data['invite_code'] = this.inviteCode;
    data['date'] = this.date;
    data['status'] = this.status;
    data['seller_number_id'] = this.sellerNumberId;
    data['__v'] = this.iV;
    return data;
  }
}

class BankAccount {
  String? name;
  String? bankName;
  String? accountNumber;
  String? ifscCode;

  BankAccount({this.name, this.bankName, this.accountNumber, this.ifscCode});

  BankAccount.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    bankName = json['bank_name'];
    accountNumber = json['account_number'];
    ifscCode = json['ifsc_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['bank_name'] = this.bankName;
    data['account_number'] = this.accountNumber;
    data['ifsc_code'] = this.ifscCode;
    return data;
  }
}

class Licence {
  String? lic20;
  String? lic21;

  Licence({this.lic20, this.lic21});

  Licence.fromJson(Map<String, dynamic> json) {
    lic20 = json['lic20'];
    lic21 = json['lic21'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lic20'] = this.lic20;
    data['lic21'] = this.lic21;
    return data;
  }
}

class Address {
  String? name;
  String? address1;
  String? address2;
  String? state;
  String? city;
  String? pincode;

  Address(
      {this.name,
      this.address1,
      this.address2,
      this.state,
      this.city,
      this.pincode});

  Address.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address1 = json['address1'];
    address2 = json['address2'];
    state = json['state'];
    city = json['city'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['state'] = this.state;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    return data;
  }
}

class GstPanResponse {
  bool? status;
  String? message;
  String? legalName;
  String? gstNumber;
  List<String>? natureOfBusinessActivity;
  GstAddress? address;

  GstPanResponse(
      {this.status,
      this.message,
      this.legalName,
      this.gstNumber,
      this.natureOfBusinessActivity,
      this.address});

  GstPanResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    legalName = json['legal_name'];
    gstNumber = json['gst_number'];
    natureOfBusinessActivity =
        json['nature_of_business_activity'].cast<String>();
    address = json['address'] != null
        ? new GstAddress.fromJson(json['address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['legal_name'] = this.legalName;
    data['gst_number'] = this.gstNumber;
    data['nature_of_business_activity'] = this.natureOfBusinessActivity;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class GstAddress {
  var buildingName;
  var city;
  String? doorNumber;
  String? dst;
  var floorNumber;
  var latitude;
  String? location;
  var longitude;
  String? pincode;
  String? stateName;
  String? street;

  GstAddress(
      {this.buildingName,
      this.city,
      this.doorNumber,
      this.dst,
      this.floorNumber,
      this.latitude,
      this.location,
      this.longitude,
      this.pincode,
      this.stateName,
      this.street});

  GstAddress.fromJson(Map<String, dynamic> json) {
    buildingName = json['building_name'];
    city = json['city'];
    doorNumber = json['door_number'];
    dst = json['dst'];
    floorNumber = json['floor_number'];
    latitude = json['latitude'];
    location = json['location'];
    longitude = json['longitude'];
    pincode = json['pincode'];
    stateName = json['state_name'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['building_name'] = this.buildingName;
    data['city'] = this.city;
    data['door_number'] = this.doorNumber;
    data['dst'] = this.dst;
    data['floor_number'] = this.floorNumber;
    data['latitude'] = this.latitude;
    data['location'] = this.location;
    data['longitude'] = this.longitude;
    data['pincode'] = this.pincode;
    data['state_name'] = this.stateName;
    data['street'] = this.street;
    return data;
  }
}
