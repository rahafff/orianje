import 'package:oringe/consts/urls.dart';
import 'package:oringe/module_auth/request/login_request/login_request.dart';
import 'package:oringe/module_auth/response/login_response/login_response.dart';
import 'package:oringe/module_network/http_client/http_client.dart';
import 'package:oringe/utils/logger/logger.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthRepository {
  final ApiClient _apiClient;
  final Logger _logger;
  AuthRepository(this._apiClient, this._logger);


  Future<LoginResponse?> getToken(LoginRequest loginRequest) async {
    var result = await _apiClient.post(
      Urls.LOGIN,
      loginRequest.toJson(),
    );
    if (result == null) {
      return null;
    }
    return LoginResponse.fromJson(result);
  }
}
