import 'package:oringe/abstracts/data_model/data_model.dart';
import 'package:oringe/module_invoices/response/invoice_reponse.dart';

class InvoiceModel extends DataModel {
  int? id;
  String? supplierName;
  String? invoiceNumber;
  String? cashBookNumber;
  String? date;
  int? type;
  bool? isPayed;
  InvoiceModel(
      {required this.id,
      required this.supplierName,
      this.invoiceNumber,
      this.type,
      this.cashBookNumber,
        this.date,
      this.isPayed});
}

class InvoiceResultModel extends DataModel {
  int? totalCount;
  List<InvoiceModel>? invoices;

  InvoiceResultModel? _model;

  InvoiceResultModel({required this.totalCount, required this.invoices});

  InvoiceResultModel.withData(InvoiceResult? data) : super.withData() {
    List<InvoiceModel>? _models;
    _models = <InvoiceModel>[];
    data?.data?.items?.forEach((element) {
      _models?.add(InvoiceModel(
          id: element.id,
          supplierName: element.supplierName ?? '',
          cashBookNumber: element.cashbookNumber ?? '',
          invoiceNumber: element.invoiceNumber ?? '',
          isPayed: element.isPaid ?? false,
          type: element.type ?? 0,date: element.date));
    });

    _model =
        InvoiceResultModel(totalCount: data?.totalCount ?? 0, invoices: _models);
  }
  InvoiceResultModel? get data => _model;
}
