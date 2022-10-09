import 'package:injectable/injectable.dart';
import 'package:oringe/consts/urls.dart';
import 'package:oringe/module_auth/service/auth_service/auth_service.dart';
import 'package:oringe/module_messages/response/msg_response.dart';
import 'package:oringe/module_network/http_client/http_client.dart';

@injectable
class MsgRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  MsgRepository(
      this._apiClient,
      this._authService,
      );

  Future<MsgGeneralData?> getMsg() async {
      var token = await _authService.getToken();
       int? clientID = await _authService.getClientID();
      dynamic response = await _apiClient.get(
        Urls.GET_CLIENT_MSG,
        queryParams: {'receiverId':clientID},
        headers: {'Authorization': 'Bearer ' + '$token'},
      );
      if (response == null) return null;
      return MsgGeneralData.fromJson(response);
    }



}