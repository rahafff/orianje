import 'package:oringe/abstracts/data_model/data_model.dart';
import 'package:oringe/module_mails/model/mails_details_model.dart';
import 'package:oringe/module_messages/response/msg_response.dart';



class MsgModel extends DataModel {
  int  id = -1;
  String  title = '';
  String  text = '';
  String  date = '';
  String senderName = '';

  List<AttachMailModel>  attachments = [];

  MsgModel(
      {required this.id,
        required this.title,
        required this.text,
        required this.senderName,
        required this.date,
       required this.attachments
      });
}

class MsgResultModel extends DataModel {
  int? totalCount;
  List<MsgModel>? mails;

  MsgResultModel? _model;

  MsgResultModel({required this.totalCount, required this.mails});

  MsgResultModel.withData(MsgResult? data) : super.withData() {
    List<MsgModel>? _models;
    _models = <MsgModel>[];



    data?.data?.items?.forEach((element) {
      List<AttachMailModel> _attachmentList =[];

      element.attachment?.items?.forEach((element) {
        _attachmentList.add(AttachMailModel(
            name: element.name ?? '',
            id: element.id ?? -1,
            extension: element.extension ?? '',
            mailId: element.mailId ?? -1,
            path: element.path ?? '',
          downloadPath: element.downloadPath ?? ''
        ));
      });

      _models?.add(MsgModel(
        id: element.id ?? -1,
        text: element.text ?? '',
        title: element.title ?? '',
        senderName: element.senderName ?? 'UNk',
        date: element.date ?? '',attachments: _attachmentList));
    });

    _model =
        MsgResultModel(totalCount: data?.totalCount ?? 0, mails: _models);
  }
  MsgResultModel? get data => _model;
}
