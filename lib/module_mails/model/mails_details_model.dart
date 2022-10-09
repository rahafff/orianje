import 'package:oringe/abstracts/data_model/data_model.dart';
import 'package:oringe/module_mails/response/mails_details_response.dart';

class MailsDetailsModel extends DataModel {
  int id = -1;
  String mailName = "";
  String mailNumber = "";
  String date = "";
  int fileFormat =0;
  bool isSeen = false;
  List<AttachMailModel>  attachments = [];

  MailsDetailsModel? _model;


  MailsDetailsModel(
      {required this.id,
      required this.mailNumber,
   required   this.mailName,
  required    this.fileFormat,
     required   this.date,
      required this.isSeen ,required this.attachments});

  MailsDetailsModel.withData(MailsDetails data) : super.withData() {
    List<AttachMailModel> _attachmentList =[];
    data.attachment?.items?.forEach((element) {
      _attachmentList.add(AttachMailModel(
           name: element.name ?? '',
        id: element.id ?? -1,
        extension: element.extension ?? '',
        mailId: element.mailId ?? -1,
        path: element.path ?? '',
downloadPath: element.downloadPath ?? ''
      ));
    });


    _model = MailsDetailsModel(
      id: data.id ?? -1,
        mailName: data.mailName ?? '',
        mailNumber: data.mailNumber ?? '',
        attachments: _attachmentList ,date: data.date ?? '',fileFormat:data.fileFormat ?? 0 ,
        isSeen: data.isSeen ?? false, );

  }
  MailsDetailsModel? get data => _model;
}

class AttachMailModel extends DataModel {
  String name;
  String extension;
  String path;
  String downloadPath;
  int mailId;
  int id;

  AttachMailModel( {required this.name,
    required this.downloadPath,
    required this.extension,required this.path,required this.mailId,required this.id});



}