class LogInModel {
  String? status;
  int? statusCode;
  Data? data;
  List<dynamic>? errors;

  LogInModel({this.status, this.statusCode, this.data, this.errors});

  LogInModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    errors = json['errors']; // Assume it's a List<dynamic> (nullable)
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['status'] = status;
    dataMap['statusCode'] = statusCode;
    if (data != null) {
      dataMap['data'] = data!.toJson();
    }
    if (errors != null) {
      dataMap['errors'] = errors;
    }
    return dataMap;
  }
}

class Data {
  String? accessToken;
  String? refreshToken;

  Data({this.accessToken, this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['accessToken'] = accessToken;
    dataMap['refreshToken'] = refreshToken;
    return dataMap;
  }
}
