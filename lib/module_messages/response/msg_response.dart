import 'package:oringe/module_auth/response/login_response/login_response.dart';
import 'package:oringe/module_mails/response/mails_details_response.dart';

class MsgGeneralData {
  MsgGeneralData({
    this.result,
    required this.success,
    this.error,
  });

  MsgResult? result;

  bool success = false;
  ErrorObj? error;

  MsgGeneralData.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    if (success = json["success"]) {
      result = MsgResult.fromJson(json["result"]);
    } else {
      error = json["error"];
    }
  }
}

class MsgResult {
  MsgResult({
    this.totalCount,
    this.data,
  });

  int? totalCount;
  Data? data;

  factory MsgResult.fromJson(Map<String, dynamic> json) => MsgResult(
    totalCount: json["totalCount"],
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  Data({
    this.items,
  });

  List<MsgResponse>? items;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    items: List<MsgResponse>.from(
        json["items"].map((x) => MsgResponse.fromJson(x))),
  );
}

class MsgResponse {
  int? id;
  String? title;
  String? text;
  String? date;
  String? senderName;
  AttachResponse ? attachment;


  MsgResponse(
      {this.text,
        this.title,
        this.date,
        this.senderName,
        this.id , this.attachment});

  MsgResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    title = json['title'];
    date = json['stringDate'];
    senderName = json['senderName'];
    attachment =AttachResponse.fromJson(json['attachments']) ;
  }
}
