import 'package:oringe/module_auth/response/login_response/login_response.dart';


class EmployeeGeneralData {
  EmployeeGeneralData({
    this.result,
    required this.success,
    this.error,
  });

  EmpResult? result;

  bool success = false;
  ErrorObj? error;

  EmployeeGeneralData.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    if (success = json["success"]) {
      result = EmpResult.fromJson(json["result"]);
    } else {
      error = json["error"];
    }
  }
}

class EmpResult {
  EmpResult({
    this.totalCount,
    this.data,
  });

  int? totalCount;
  Data? data;

  factory EmpResult.fromJson(Map<String, dynamic> json) => EmpResult(
    totalCount: json["totalCount"],
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  Data({
    this.items,
  });

  List<EmployeeResponse>? items;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    items: List<EmployeeResponse>.from(
        json["items"].map((x) => EmployeeResponse.fromJson(x))),
  );
}

class EmployeeResponse{
  int? id;
  String? fullName;
  String? phone;
  String? email;

  EmployeeResponse({this.fullName, this.phone, this.email ,this.id});



  EmployeeResponse.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    phone = json['phone'];
    email = json['email'];
    id = json['id'];

  }
}