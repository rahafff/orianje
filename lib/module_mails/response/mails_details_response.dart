import 'package:oringe/module_auth/response/login_response/login_response.dart';

class MailsDetailsGeneralData {
  MailsDetailsGeneralData({
    this.result,
    required this.success,
    this.error,
  });

  MailsDetailsResponse? result;

  bool success = false;
  ErrorObj? error;

  MailsDetailsGeneralData.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    if (success = json["success"]) {
      result = MailsDetailsResponse.fromJson(json["result"]);
    } else {
      error = json["error"];
    }
  }
}

class MailsDetailsResponse {
  MailsDetailsResponse({
    this.data,
  });
  MailsDetails? data;

  factory MailsDetailsResponse.fromJson(Map<String, dynamic> json) =>
      MailsDetailsResponse(
        data: MailsDetails.fromJson(json["data"]),
      );
}

class MailsDetails {
  int? id;
  String? mailName;
  String? mailNumber;
  String? date;
  int? fileFormat;
  bool? isSeen;
   AttachResponse ? attachment;

  MailsDetails(
      {this.mailName,
        this.mailNumber,
        this.date,
        this.isSeen,
        this.fileFormat,
        this.id ,this.attachment});

  MailsDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mailNumber = json['mailNumber'];
    mailName = json['mailName'];
    date = json['date'];
    fileFormat = json['fileFormat'];
    isSeen = json['isSeen'];
    attachment =AttachResponse.fromJson(json['attachments']) ;
  }
}

class AttachResponse {
  AttachResponse({
    this.items,
  });

  List<AttachItem>? items;

  factory AttachResponse.fromJson(Map<String, dynamic> json) => AttachResponse(
    items: List<AttachItem>.from(
        json["items"].map((x) => AttachItem.fromJson(x))),
  );
}

class AttachItem{
  int? id;
  String? name;
  String? extension;
  String? path;
  String? downloadPath;
  int? mailId;

  AttachItem(
      {this.name, this.extension,this.downloadPath , this.path, this.mailId, this.id});

  AttachItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    extension = json['extension'];
    path = json['path'];
    mailId = json['mailId'];
    downloadPath = json['downloadPath'];
  }
}
