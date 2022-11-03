import 'package:oringe/module_auth/enums/auth_status.dart';
import 'package:oringe/module_auth/service/auth_service/auth_service.dart';
import 'package:oringe/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:oringe/module_auth/ui/screen/login_screen/signup_screen.dart';
import 'package:oringe/module_auth/ui/states/login_states/login_state.dart';
import 'package:oringe/module_auth/ui/states/login_states/login_state_init.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:oringe/module_auth/ui/states/login_states/signup_state_init.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class SignUpStateManager {
  final AuthService _authService;
  final PublishSubject<SignUpState> _loginStateSubject =
      PublishSubject<SignUpState>();

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  late SignUpScreenState _screenState;

  SignUpStateManager(this._authService)  {
    _authService.authListener.listen((event) async{
      _loadingStateSubject.add(AsyncSnapshot.nothing());
      switch (event) {
        case AuthStatus.SIGNUP_SUCCESS:
          _screenState.showSuccessAlter();
          break;
        default:
          _loginStateSubject.add(SignUpStateInit(_screenState));
          break;
      }
    }).onError((err) {
      _loadingStateSubject.add(AsyncSnapshot.nothing());
      _loginStateSubject.add(SignUpStateInit(_screenState, error: err));
    });
  }

  Stream<SignUpState> get stateStream => _loginStateSubject.stream;
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;

  void signUpClient(
    String username,
    String email,
    String password,
      SignUpScreenState _loginScreenState,
  ) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _authService.signUp().then((value) {
      _loadingStateSubject.add(AsyncSnapshot.nothing());
      _loginScreenState.showSuccessAlter();
    });
  }

}
