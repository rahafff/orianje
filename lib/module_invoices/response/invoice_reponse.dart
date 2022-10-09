import 'package:oringe/module_auth/response/login_response/login_response.dart';

class InvoiceGeneralData {
  InvoiceGeneralData({
    this.result,
    required this.success,
    this.error,
  });

  InvoiceResult? result;

  bool success = false;
  ErrorObj? error;

  InvoiceGeneralData.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    if (success = json["success"]) {
      result = InvoiceResult.fromJson(json["result"]);
    } else {
      error = json["error"];
    }
  }
}

class InvoiceResult {
  InvoiceResult({
    this.totalCount,
    this.data,
  });

  int? totalCount;
  Data? data;

  factory InvoiceResult.fromJson(Map<String, dynamic> json) => InvoiceResult(
        totalCount: json["totalCount"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.items,
  });

  List<InvoiceResponse>? items;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: List<InvoiceResponse>.from(
            json["items"].map((x) => InvoiceResponse.fromJson(x))),
      );
}

class InvoiceResponse {
  int? id;
  String? supplierName;
  String? cashbookNumber;
  String? date;
  String? invoiceNumber;
  int? type;
  bool? isPaid;

  InvoiceResponse(
      {this.supplierName,
      this.cashbookNumber,
      this.date,
      this.invoiceNumber,
      this.isPaid,
      this.type,
      this.id});

  InvoiceResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supplierName = json['supplierName'];
    cashbookNumber = json['cashbookNumber'];
    invoiceNumber = json['invoiceNumber'];
    date = json['date'];
    type = json['type'];
    isPaid = json['isPaid'];
  }
}
