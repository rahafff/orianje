class CreateInvoiceRequest {
  String? supplierName;
  String? cashbookNumber;
  String? invoiceNumber;
  int? type;
  String? date;
  int? clientId;
  List<AttachRequest> attachment = [];

  CreateInvoiceRequest(
      {this.supplierName,
      this.cashbookNumber,
      this.invoiceNumber,
      this.type,
      this.date,
      this.clientId,
      required this.attachment});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['clientId'] = this.clientId;
    data['supplierName'] = this.supplierName;
    data['cashbookNumber'] = this.cashbookNumber;
    data['invoiceNumber'] = this.invoiceNumber;
    data['type'] = this.type;
    data['date'] = this.date;
    var dataAttach = [];
    attachment.forEach((element) {
      dataAttach.add(element.toJson());
    });

    data['attachmentInvoiceInputs'] = dataAttach;

    return data;
  }
}

class AttachRequest {
  String? name;
  String? extension;
  String? path;

  AttachRequest(
    this.name,
    this.extension,
    this.path,
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = this.name;
    data['extension'] = this.extension;
    data['path'] = this.path;

    return data;
  }
}
