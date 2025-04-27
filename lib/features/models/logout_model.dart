class LogOutModel {
  String? status;
  int? statusCode;
  String? data;
  List<dynamic>? errors; // fixed here

  LogOutModel({this.status, this.statusCode, this.data, this.errors});

  factory LogOutModel.fromJson(Map<String, dynamic> json) {
    return LogOutModel(
      status: json['status'],
      statusCode: json['statusCode'],
      data: json['data'],
      errors: json['errors'] != null ? List<dynamic>.from(json['errors']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['status'] = status;
    json['statusCode'] = statusCode;
    json['data'] = data;
    if (errors != null) {
      json['errors'] = errors;
    }
    return json;
  }
}
