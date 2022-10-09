class LoginRequest {
  String? username;
  String? password;
  bool? rememberClient;

  LoginRequest({this.username, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userNameOrEmailAddress'] = this.username;
    data['password'] = this.password;
    data['rememberClient'] =true;
    return data;
  }
}
