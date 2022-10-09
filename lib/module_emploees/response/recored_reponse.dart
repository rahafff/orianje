import 'package:oringe/module_auth/response/login_response/login_response.dart';


class RecordGeneralData {
  RecordGeneralData({
    this.result,
    required this.success,
    this.error,
  });

  RecordResult? result;

  bool success = false;
  ErrorObj? error;

  RecordGeneralData.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    if (success = json["success"]) {
      result = RecordResult.fromJson(json["result"]);
    } else {
      error = json["error"];
    }
  }
}

class RecordResult {
  RecordResult({
    this.totalCount,
    this.data,
  });

  int? totalCount;
  Data? data;

  factory RecordResult.fromJson(Map<String, dynamic> json) => RecordResult(
    totalCount: json["totalCount"],
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  Data({
    this.items,
  });

  List<RecordResponse>? items;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    items: List<RecordResponse>.from(
        json["items"].map((x) => RecordResponse.fromJson(x))),
  );
}

class RecordResponse{

  num? days;
  num? hours;

  int? year;
  int? month;
  int? id;

  RecordResponse({this.days, this.hours, this.year ,this.month,this.id});



  RecordResponse.fromJson(Map<String, dynamic> json) {
    days = json['days'];
    hours = json['hours'];
    year = json['year'];
    month = json['month'];
    id = json['id'];

  }
}