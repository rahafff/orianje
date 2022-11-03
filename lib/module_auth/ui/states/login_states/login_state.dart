import 'package:oringe/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:oringe/module_auth/ui/screen/login_screen/signup_screen.dart';

abstract class LoginState {
  final LoginScreenState screen;
  LoginState(this.screen);

  Widget getUI(BuildContext context);
}
abstract class SignUpState {
  final SignUpScreenState screen;
  SignUpState(this.screen);

  Widget getUI(BuildContext context);
}
