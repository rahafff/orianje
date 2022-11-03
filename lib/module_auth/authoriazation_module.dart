import 'package:oringe/abstracts/module/yes_module.dart';
import 'package:oringe/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:oringe/module_auth/ui/screen/login_screen/signup_screen.dart';

import 'authorization_routes.dart';

@injectable
class AuthorizationModule extends YesModule {
  final LoginScreen _loginScreen;
  final SignUpScreen _signUpScreen;


  AuthorizationModule(
      this._loginScreen, this._signUpScreen, ) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      AuthorizationRoutes.LOGIN_SCREEN: (context) => _loginScreen,
      AuthorizationRoutes.REGISTER_SCREEN: (context) => _signUpScreen,

    };
  }
}
