import 'package:oringe/abstracts/data_model/data_model.dart';
import 'package:oringe/module_mails/response/mails_reponse.dart';
import 'package:oringe/utils/helpers/status_code_helper.dart';

class MailsModel extends DataModel {
  int  id = -1;
  String  mailName = '';
  String  mailNumber = '';
  String  date = '';
  String fileFormat = '';
  bool  isSeen = false;
  MailsModel(
      {required this.id,
        required this.mailNumber,
        required this.mailName,
        required this.fileFormat,
        required  this.isSeen,
        required this.date,
      });
}

class MailsResultModel extends DataModel {
  int? totalCount;
  List<MailsModel>? mails;

  MailsResultModel? _model;

  MailsResultModel({required this.totalCount, required this.mails});

  MailsResultModel.withData(MailsResult? data) : super.withData() {
    List<MailsModel>? _models;
    _models = <MailsModel>[];
    data?.data?.items?.forEach((element) {
      _models?.add(MailsModel(
        id: element.id ?? -1,
        mailNumber: element.mailNumber ?? '',
        mailName: element.mailName ?? '',
        isSeen: element.isSeen ?? false,
        fileFormat: StatusCodeHelper.getMailTypeMessages(element.fileFormat ?? 0),
        date: element.date ?? '',));
    });

    _model =
        MailsResultModel(totalCount: data?.totalCount ?? 0, mails: _models);
  }
  MailsResultModel? get data => _model;
}