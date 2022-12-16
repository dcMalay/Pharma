class PanModel {
  PanModel({
    this.onlyPan,
    this.data,
  });

  bool? onlyPan;
  PanModelData? data;

  factory PanModel.fromJson(Map<String, dynamic> json) => PanModel(
        onlyPan: json["ONLY_PAN"],
        data: PanModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "ONLY_PAN": onlyPan,
        "data": data!.toJson(),
      };
}

class PanModelData {
  PanModelData({
    this.error,
    this.data,
  });

  bool? error;
  DataData? data;

  factory PanModelData.fromJson(Map<String, dynamic> json) => PanModelData(
        error: json["error"],
        data: DataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data!.toJson(),
      };
}

class DataData {
  DataData({
    this.status,
    this.response,
  });

  Status? status;
  Response? response;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        status: Status.fromJson(json["status"]),
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status!.toJson(),
        "response": response!.toJson(),
      };
}

class Response {
  Response({
    this.number,
    this.name,
    this.typeOfHolder,
    this.isIndividual,
    this.isValid,
    this.firstName,
    this.middleName,
    this.lastName,
    this.title,
    this.panStatusCode,
    this.panStatus,
    this.aadhaarSeedingStatus,
    this.aadhaarSeedingStatusCode,
    this.lastUpdatedOn,
  });

  String? number;
  String? name;
  String? typeOfHolder;
  bool? isIndividual;
  bool? isValid;
  String? firstName;
  String? middleName;
  String? lastName;
  String? title;
  String? panStatusCode;
  String? panStatus;
  String? aadhaarSeedingStatus;
  String? aadhaarSeedingStatusCode;
  String? lastUpdatedOn;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        number: json["number"],
        name: json["name"],
        typeOfHolder: json["typeOfHolder"],
        isIndividual: json["isIndividual"],
        isValid: json["isValid"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        title: json["title"],
        panStatusCode: json["panStatusCode"],
        panStatus: json["panStatus"],
        aadhaarSeedingStatus: json["aadhaarSeedingStatus"],
        aadhaarSeedingStatusCode: json["aadhaarSeedingStatusCode"],
        lastUpdatedOn: json["lastUpdatedOn"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "typeOfHolder": typeOfHolder,
        "isIndividual": isIndividual,
        "isValid": isValid,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "title": title,
        "panStatusCode": panStatusCode,
        "panStatus": panStatus,
        "aadhaarSeedingStatus": aadhaarSeedingStatus,
        "aadhaarSeedingStatusCode": aadhaarSeedingStatusCode,
        "lastUpdatedOn": lastUpdatedOn,
      };
}

class Status {
  Status({
    this.statusCode,
    this.statusMessage,
  });

  int? statusCode;
  String? statusMessage;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        statusCode: json["statusCode"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "statusMessage": statusMessage,
      };
}
