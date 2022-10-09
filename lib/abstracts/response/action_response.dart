import 'package:oringe/module_auth/response/login_response/login_response.dart';

class ActionResponse {
  ActionResponse({required this.success, this.errorObj});

  bool success = false;
  ErrorObj? errorObj;

  ActionResponse.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    if (!json["success"])
      errorObj = ErrorObj.fromJson(json['error']);
  }
}
