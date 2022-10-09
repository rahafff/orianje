import 'package:oringe/abstracts/data_model/data_model.dart';
import 'package:oringe/module_invoices/response/attach_response.dart';
import 'package:oringe/module_invoices/response/invoice_reponse.dart';

class InvoiceDetailsModel extends DataModel {
  int id = -1;
  String supplierName = "";
  String invoiceNumber = "";
  String cashBookNumber = "";
  String date = "";
  int type =0;
  bool isPayed = false;
  List<AttachModel>  attachments = [];

  InvoiceDetailsModel? _model;


  InvoiceDetailsModel(
      {required this.id,
      required this.supplierName,
   required   this.invoiceNumber,
  required    this.type,
     required this.cashBookNumber,
     required   this.date,
      required this.isPayed ,required this.attachments});

  InvoiceDetailsModel.withData(InvoiceDetails data) : super.withData() {
    List<AttachModel> _attachmentList =[];
    data.attachResponse?.items?.forEach((element) {
      _attachmentList.add(AttachModel(
           name: element.name ?? '',
        id: element.id ?? -1,
        extension: element.extension ?? '',
        invoiceId: element.invoiceId ?? -1,
        path: element.path ?? '',
        downloadPath: element.downloadPath ?? ''

      ));
    });


    _model = InvoiceDetailsModel( id: data.id ?? -1,
        supplierName: data.supplierName ?? '',
        invoiceNumber: data.invoiceNumber ?? '',
        attachments: _attachmentList ,date: data.date ?? '',type:data.type ?? 0 ,
        isPayed: data.isPaid ?? false,cashBookNumber:  data.cashbookNumber ?? '');

  }
  InvoiceDetailsModel? get data => _model;
}

class AttachModel extends DataModel {
  String name;
  String extension;
  String path;
  String downloadPath;
  int invoiceId;
  int id;

  AttachModel( {
   required this.downloadPath,
    required this.name,required this.extension,required this.path,required this.invoiceId,required this.id});



}