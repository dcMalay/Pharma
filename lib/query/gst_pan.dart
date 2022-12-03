import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pharma/query/buyer/global.dart';
import 'package:pharma/query/seller/global.dart';

Future<GstPanResoponse?> getGstPanMethod(BuildContext context,
    {required String userType, required GstPanParams body}) async {
  try {
    var data = userType == "buyer"
        ? await BuyerGlobalHandler.requestPost(
            '/$userType/auth/check/pan/gst', body.toJson())
        : await SellerGlobalHandler.requestPost(
            '/$userType/auth/check/pan/gst', body.toJson());
    print(data.body);
    var jsonData = jsonDecode(data.body);

    GstPanResoponse response = GstPanResoponse.fromJson(jsonData);
    print(response.toJson());
    return response;
  } catch (e) {
    print(e);
    context.loaderOverlay.hide();
    SellerGlobalHandler.snackBar(
        context: context, message: e.toString(), isError: true);
    return null;
  }
}

class GstPanParams {
  String? typeName;
  String? panNumber;
  String? gstNumber;

  GstPanParams({this.typeName, this.panNumber, this.gstNumber});

  GstPanParams.fromJson(Map<String, dynamic> json) {
    typeName = json['type_name'];
    panNumber = json['pan_number'];
    gstNumber = json['gst_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type_name'] = this.typeName;
    data['pan_number'] = this.panNumber;
    data['gst_number'] = this.gstNumber;
    return data;
  }
}

class GstPanResoponse {
  bool? status;
  String? message;
  String? legalName;
  String? gstNumber;
  List<String>? natureOfBusinessActivity;
  Address? address;

  GstPanResoponse(
      {this.status,
      this.message,
      this.legalName,
      this.gstNumber,
      this.natureOfBusinessActivity,
      this.address});

  GstPanResoponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    legalName = json['legal_name'];
    gstNumber = json['gst_number'];
    if (json['nature_of_business_activity'] != null) {
      natureOfBusinessActivity =
          json['nature_of_business_activity'].cast<String>();
    }

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

class Address {
  Null? buildingName;
  Null? city;
  String? doorNumber;
  String? dst;
  Null? floorNumber;
  Null? latitude;
  String? location;
  Null? longitude;
  String? pincode;
  String? stateName;
  String? street;

  Address(
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

  Address.fromJson(Map<String, dynamic> json) {
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
