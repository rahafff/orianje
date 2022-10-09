import 'package:oringe/abstracts/data_model/data_model.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_change_pass/manager/change_pass_manager.dart';
import 'package:oringe/module_change_pass/request/change_pass_request.dart';
import 'package:injectable/injectable.dart';
import '../../abstracts/response/action_response.dart';

@injectable
class PasswordService {
  final PasswordManager _manager;

  PasswordService(this._manager);

  Future<DataModel> changePass(ChangePassRequest request) async {
    ActionResponse? _response = await _manager.changePass(request);
    if (_response == null) {
      return DataModel.withError(S.current.networkError);
    }
    if ( !_response.success) {
      return DataModel.withError(
          'errror');
    }
    return DataModel.withData();
  }


}