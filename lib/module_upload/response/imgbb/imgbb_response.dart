class ImgBBResponse {
  String? url;

  ImgBBResponse({this.url});

  ImgBBResponse.fromJson(Map<String, dynamic> json) {
    url = json["result"];

  }
}
