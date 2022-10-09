import 'package:oringe/abstracts/response/action_response.dart';
import 'package:oringe/consts/urls.dart';
import 'package:oringe/module_auth/service/auth_service/auth_service.dart';
import 'package:oringe/module_change_pass/request/change_pass_request.dart';
import 'package:oringe/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePassRepository {
  final ApiClient _apiClient;
  final AuthService _authService;
  ChangePassRepository(this._apiClient, this._authService);


  Future<ActionResponse?> changePass(ChangePassRequest request) async {
    var token = await _authService.getToken();

    var result = await _apiClient.post(
      "",
      request.toJson(),
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (result == null) {
      return null;
    }
    return ActionResponse.fromJson(result);
  }
}