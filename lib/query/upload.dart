import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pharma/query/const.dart';
import 'package:pharma/query/seller/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

Dio dio = Dio();

Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("seller_token");

  return token;
}

Future postImage(
  data,
) async {
  var token = await getToken();
  print(token);
  dio.options.headers['content-Type'] = 'application/json';
  dio.options.headers["authorization"] = "bearer $token";
//using dio to post imagename to the mongodg api and the name we get from the php server
  var postData = await dio.post("http://65.2.38.131/upload.php", data: data);
  print('postdata----->${postData.statusCode}');
  return postData;
}

class UploadDataResponse {
  UploadDataResponse({
    required this.postUploaded,
  });

  PostUploaded postUploaded;

  factory UploadDataResponse.fromJson(Map<String, dynamic> json) =>
      UploadDataResponse(
        postUploaded: PostUploaded.fromJson(json["post uploaded"]),
      );

  Map<String, dynamic> toJson() => {
        "post uploaded": postUploaded.toJson(),
      };
}

class PostUploaded {
  PostUploaded({
    required this.postImage,
  });

  List<String> postImage;

  factory PostUploaded.fromJson(Map<String, dynamic> json) => PostUploaded(
        postImage: List<String>.from(json["post_image"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "post_image": List<dynamic>.from(postImage.map((x) => x)),
      };
}

Future<UploadedImageResponse?> imageUpload(
    BuildContext context, File file) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse(baseUrl + '/seller/auth/imageUpload'));
  var token = await SellerGlobalHandler.getHeaders();

  request.headers.addAll(token!);

  request.files.add(await http.MultipartFile.fromPath('file', file.path));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var res = await response.stream.bytesToString();
    var js = json.decode(res);

    UploadedImageResponse uploadedImageResponse =
        UploadedImageResponse.fromJson(js);
    return uploadedImageResponse;
  } else {
    var res = await response.stream.bytesToString();
    var js = json.decode(res);
    SellerGlobalHandler.snackBar(
        context: context, isError: true, message: js['message']);
  }
  return null;
}

class UploadedImageResponse {
  int? status;
  ResultImage? resultImage;

  UploadedImageResponse({this.status, this.resultImage});

  UploadedImageResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    resultImage = json['result_image'] != null
        ? ResultImage.fromJson(json['result_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (resultImage != null) {
      data['result_image'] = resultImage!.toJson();
    }
    return data;
  }
}

class ResultImage {
  String? eTag;
  String? location;
  String? key;
  String? bucket;

  ResultImage({this.eTag, this.location, this.key, this.bucket});

  ResultImage.fromJson(Map<String, dynamic> json) {
    eTag = json['ETag'];
    location = json['Location'];
    key = json['key'];
    key = json['Key'];
    bucket = json['Bucket'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ETag'] = eTag;
    data['Location'] = location;
    data['key'] = key;
    data['Key'] = key;
    data['Bucket'] = bucket;
    return data;
  }
}
