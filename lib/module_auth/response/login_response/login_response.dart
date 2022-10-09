import 'package:oringe/utils/logger/logger.dart';

class LoginResponse {
  LoginResponse({
    this.result,
    required this.success,
    this.error,
  });

  Result? result;
  bool success = false;
  ErrorObj? error;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    try {
      success = json["success"];
      if (success) {
        result = Result.fromJson(json["result"]);
      } else {
        error = ErrorObj.fromJson(json["error"]);
      }
    } catch (e) {
      Logger().error('Auth login Response', e.toString(), StackTrace.current);
    }
  }
}

class Result {
  Result({this.accessToken, this.encryptedAccessToken, this.clientId});

  String? accessToken;
  String? encryptedAccessToken;
  int? clientId;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        accessToken: json["accessToken"],
        encryptedAccessToken: json["encryptedAccessToken"],
        clientId: json["clientId"] ?? 1,
      );
}

class ErrorObj {
  ErrorObj({
    this.code,
    this.message,
    this.details,
  });

  int? code;
  String? message;
  String? details;

  factory ErrorObj.fromJson(Map<String, dynamic> json) => ErrorObj(
        code: json["code"],
        message: json["message"],
        details: json["details"],
      );
}
