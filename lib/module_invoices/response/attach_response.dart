import 'package:oringe/module_auth/response/login_response/login_response.dart';

class InvoiceDetailsGeneralData {
  InvoiceDetailsGeneralData({
    this.result,
    required this.success,
    this.error,
  });

  InvoiceDetailsResponse? result;

  bool success = false;
  ErrorObj? error;

  InvoiceDetailsGeneralData.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    if (success = json["success"]) {
      result = InvoiceDetailsResponse.fromJson(json["result"]);
    } else {
      error = json["error"];
    }
  }
}

class InvoiceDetailsResponse {
  InvoiceDetailsResponse({
    this.data,
  });
  InvoiceDetails? data;

  factory InvoiceDetailsResponse.fromJson(Map<String, dynamic> json) =>
      InvoiceDetailsResponse(
        data: InvoiceDetails.fromJson(json["data"]),
      );
}

class InvoiceDetails {
  int? id;
  String? supplierName;
  String? cashbookNumber;
  String? date;
  String? invoiceNumber;
  int? type;
  bool? isPaid;
  AttachResponse? attachResponse;

  InvoiceDetails(
      {this.supplierName,
      this.cashbookNumber,
      this.date,
      this.invoiceNumber,
      this.isPaid,
      this.type,
        this.attachResponse,
      this.id});

  InvoiceDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supplierName = json['supplierName'];
    cashbookNumber = json['cashbookNumber'];
    invoiceNumber = json['invoiceNumber'];
    date = json['date'];
    type = json['type'];
    isPaid = json['isPaid'];
    attachResponse =AttachResponse.fromJson(json['attachments']) ;
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
  int? invoiceId;

  AttachItem(
      {this.name, this.extension, this.path, this.invoiceId, this.id , this.downloadPath});

  AttachItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    extension = json['extension'];
    path = json['path'];
    invoiceId = json['invoiceId'];
    downloadPath = json['downloadPath'];
  }
}
