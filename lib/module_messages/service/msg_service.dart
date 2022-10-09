import 'package:injectable/injectable.dart';
import 'package:oringe/abstracts/data_model/data_model.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_messages/model/msg_model.dart';
import 'package:oringe/module_messages/repository/msg_repository.dart';
import 'package:oringe/module_messages/response/msg_response.dart';

@injectable
class MsgService {
  final MsgRepository _manager;

  MsgService(this._manager);

  Future<DataModel> getMsg( ) async {
    MsgGeneralData? _response = await _manager.getMsg();
    if (_response == null) {
      return DataModel.withError(S.current.networkError);
    }
    if ( !_response.success) {
      return DataModel.withError(_response.error?.message);
    }

    return MsgResultModel.withData(_response.result);
  }


}