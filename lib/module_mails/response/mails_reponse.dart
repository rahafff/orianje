import 'package:oringe/module_auth/response/login_response/login_response.dart';

class MailsGeneralData {
  MailsGeneralData({
    this.result,
    required this.success,
    this.error,
  });

  MailsResult? result;

  bool success = false;
  ErrorObj? error;

  MailsGeneralData.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    if (success = json["success"]) {
      result = MailsResult.fromJson(json["result"]);
    } else {
      error = json["error"];
    }
  }
}

class MailsResult {
  MailsResult({
    this.totalCount,
    this.data,
  });

  int? totalCount;
  Data? data;

  factory MailsResult.fromJson(Map<String, dynamic> json) => MailsResult(
        totalCount: json["totalCount"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.items,
  });

  List<MailResponse>? items;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: List<MailResponse>.from(
            json["items"].map((x) => MailResponse.fromJson(x))),
      );
}

class MailResponse {
  int? id;
  String? mailName;
  String? mailNumber;
  String? date;
  int? fileFormat;
  bool? isSeen;

  MailResponse(
      {this.mailName,
      this.mailNumber,
      this.date,
      this.isSeen,
      this.fileFormat,
      this.id});

  MailResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mailNumber = json['mailNumber'];
    mailName = json['mailName'];
    date = json['date'];
    fileFormat = json['fileFormat'];
    isSeen = json['isSeen'];
  }
}
