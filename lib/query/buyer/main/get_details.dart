import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pharma/query/buyer/global.dart';

Future<GetBuyerDetails?> getBuyerDetailsMethod(BuildContext context) async {
  try {
    var data = await BuyerGlobalHandler.requestGet('/buyer/auth/profile');

    var jsonData = jsonDecode(data.body);

    GetBuyerDetails response = GetBuyerDetails.fromJson(jsonData);
    return response;
  } catch (e) {
    BuyerGlobalHandler.snackBar(
        context: context, message: e.toString(), isError: true);
    return null;
  }
}

class GetBuyerDetails {
  int? status;
  String? message;
  BuyerUser? buyerUser;
  BuyerDetails? buyerDetails;
  bool? isAccountFound;

  GetBuyerDetails(
      {this.status,
      this.message,
      this.buyerUser,
      this.buyerDetails,
      this.isAccountFound});

  GetBuyerDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    buyerUser = json['buyer_user'] != null
        ? new BuyerUser.fromJson(json['buyer_user'])
        : null;
    buyerDetails = json['buyer_details'] != null
        ? new BuyerDetails.fromJson(json['buyer_details'])
        : null;
    isAccountFound = json['is_account_found'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.buyerUser != null) {
      data['buyer_user'] = this.buyerUser!.toJson();
    }
    if (this.buyerDetails != null) {
      data['buyer_details'] = this.buyerDetails!.toJson();
    }
    data['is_account_found'] = this.isAccountFound;
    return data;
  }
}

class BuyerUser {
  String? sId;
  int? phoneNo;
  String? password;
  String? expirePassword;
  String? dateTime;
  String? message;
  bool? isUserBlock;
  int? status;
  int? iV;

  BuyerUser(
      {this.sId,
      this.phoneNo,
      this.password,
      this.expirePassword,
      this.dateTime,
      this.message,
      this.isUserBlock,
      this.status,
      this.iV});

  BuyerUser.fromJson(Map<String, dynamic> json) {
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

class BuyerDetails {
  String? sId;
  String? buyerId;
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
  int? buyerNumberId;
  int? iV;

  BuyerDetails(
      {this.sId,
      this.buyerId,
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
      this.buyerNumberId,
      this.iV});

  BuyerDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    buyerId = json['buyer_id'];
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
    buyerNumberId = json['buyer_number_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['buyer_id'] = this.buyerId;
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
    data['buyer_number_id'] = this.buyerNumberId;
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
  Address? address;

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
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
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

class BuyerAddress {
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

  BuyerAddress(
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

  BuyerAddress.fromJson(Map<String, dynamic> json) {
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
