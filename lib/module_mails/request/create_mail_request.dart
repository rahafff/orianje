import 'package:oringe/module_invoices/request/create_invoice_request.dart';

class CreateMailRequest {
  String? mailName;
  String? mailNumber;
  int? fileFormat;

  String? date;
  int? clientId;
  List<AttachRequest> attachment = [];

  CreateMailRequest(
      {this.mailName,
        this.mailNumber,
        this.fileFormat,

        this.date,
        this.clientId,
        required this.attachment});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['clientId'] = this.clientId;
    data['mailNumber'] = this.mailNumber;
    data['mailName'] = this.mailName;
    data['fileFormat'] = this.fileFormat;
    data['date'] = this.date;

    var dataAttach = [];
    attachment.forEach((element) {
      dataAttach.add(element.toJson());
    });

    data['mailAttachments'] = dataAttach;

    return data;
  }
}
