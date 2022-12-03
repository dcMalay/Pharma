import 'dart:io';

import 'package:pharma/query/const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class BuyerGlobalHandler {
  static Future setToken(String token) async {
    await SharedPreferences.getInstance().then((prefs) {
      prefs.setString("buyer_token", token);
      prefs.setBool("buyer_is_loggedin", true);
    });
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("buyer_token");

    return token;
  }

  static logout() async {
    await SharedPreferences.getInstance().then((prefs) {
      prefs.setString("buyer_token", "");
      prefs.setBool("buyer_is_loggedin", false);
      exit(0);
    });
  }

  static Future<bool> checkLogedin() async {
    var prefs = await SharedPreferences.getInstance();
    var isLogedin = prefs.getBool("buyer_is_loggedin");
    print(isLogedin);
    return isLogedin ?? false;
  }

  static Future<Map<String, String>?> getHeaders() async {
    var token = await getToken();
    return {"Accept": "application/json", 'auth-token': token ?? ""};
  }

  static Future<http.Response> requestPost(String path, Object? body) async {
    var headers = await getHeaders();
    // print(headers);
    var response = await http.post(
      Uri.parse(baseUrl + path),
      body: body,
      headers: headers,
    );

    return response;
  }

  static Future<http.Response> requestPostCompleteUrl(
      String path, Object? body) async {
    var headers = await getHeaders();
    var response = await http.post(
      Uri.parse(path),
      body: body,
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> requestGet(String path) async {
    var headers = await getHeaders();
    var response = await http.get(
      Uri.parse(baseUrl + path),
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> requestPut(String path, Object? body) async {
    var headers = await getHeaders();
    var response = await http.put(
      Uri.parse(baseUrl + path),
      body: body,
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> requestDelete(String path) async {
    var headers = await getHeaders();
    var response = await http.delete(
      Uri.parse(baseUrl + path),
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> requestPatch(String path, Object? body) async {
    var headers = await getHeaders();
    var response = await http.patch(
      Uri.parse(baseUrl + path),
      body: body,
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> requestUpload(String path, Object? body) async {
    var headers = await getHeaders();
    var response = await http.post(
      Uri.parse(baseUrl + path),
      body: body,
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> requestDownload(String path) async {
    var headers = await getHeaders();
    var response = await http.get(
      Uri.parse(baseUrl + path),
      headers: headers,
    );
    return response;
  }

  static void snackBar(
      {required BuildContext context,
      required String message,
      bool? isSuccess,
      bool? isError,
      bool? isWarning}) {
    if (isSuccess != null && isSuccess) {
      showTopSnackBar(
        context,
        CustomSnackBar.success(
          message: message,
        ),
      );
    }
    if (isError != null && isError) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: message,
        ),
      );
    }
    if (isWarning != null && isWarning) {
      showTopSnackBar(
        context,
        CustomSnackBar.info(
          message: message,
        ),
      );
    }
  }
}
