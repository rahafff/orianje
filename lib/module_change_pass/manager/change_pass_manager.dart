import 'package:oringe/abstracts/response/action_response.dart';
import 'package:oringe/module_change_pass/repository/chnage_pass_repo.dart';
import 'package:oringe/module_change_pass/request/change_pass_request.dart';
import 'package:injectable/injectable.dart';

@injectable
class PasswordManager {

  final ChangePassRepository _repository;

  PasswordManager(this._repository);


  Future<ActionResponse?> changePass(ChangePassRequest request) => _repository.changePass(request);


}