class ChangePassRequest{
  String newPassword;
  String oldPass;
  ChangePassRequest(this.newPassword ,this.oldPass);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPassword'] = this.oldPass;
    data['newPassword'] = this.newPassword;
    return data;
  }

}