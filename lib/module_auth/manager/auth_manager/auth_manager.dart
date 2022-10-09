import 'package:oringe/module_auth/repository/auth/auth_repository.dart';
import 'package:oringe/module_auth/request/login_request/login_request.dart';
import 'package:oringe/module_auth/response/login_response/login_response.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthManager {
  final AuthRepository _authRepository;
  AuthManager(this._authRepository);

  Future<LoginResponse?> login(LoginRequest loginRequest) =>
      _authRepository.getToken(loginRequest);

}
