import 'package:injectable/injectable.dart';
import 'package:oringe/abstracts/data_model/data_model.dart';
import 'package:oringe/abstracts/response/action_response.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_mails/model/mails_details_model.dart';
import 'package:oringe/module_mails/model/mails_model.dart';
import 'package:oringe/module_mails/repository/mails_repository.dart';
import 'package:oringe/module_mails/request/create_mail_request.dart';
import 'package:oringe/module_mails/request/mails_filter_request.dart';
import 'package:oringe/module_mails/response/mails_details_response.dart';
import 'package:oringe/module_mails/response/mails_reponse.dart';

@injectable
class MailsService {
  final MailsRepository _manager;

  MailsService(this._manager);

  Future<DataModel> getMails(MailsFilterRequest request) async {
    MailsGeneralData? _response = await _manager.getMails(request);
    if (_response == null) {
      return DataModel.withError(S.current.networkError);
    }
    if ( !_response.success) {
      return DataModel.withError(_response.error?.message);
    }

    return MailsResultModel.withData(_response.result);
  }

  Future<DataModel> getMailDetails(int id) async {
    MailsDetailsGeneralData? _response = await _manager.getMailDetails(id);
    if (_response == null) {
      return DataModel.withError(S.current.networkError);
    }
    if ( !_response.success) {
      return DataModel.withError(_response.error?.message);
    }
    print('ressssosososo');
    print(_response.result);
    return MailsDetailsModel.withData(_response.result!.data!);
  }

  Future<DataModel> createMail(CreateMailRequest request) async {
    ActionResponse? _response = await _manager.createMail(request);
    if (_response == null) {
      return DataModel.withError(S.current.networkError);
    }
    if ( !_response.success) {
      return DataModel.withError(_response.errorObj?.message);
    }
    print('ressssosososo');
//    print(_response.result);
    return DataModel.withData();
  }
}