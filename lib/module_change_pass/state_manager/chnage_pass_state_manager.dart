import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_auth/authorization_routes.dart';
import 'package:oringe/module_auth/service/auth_service/auth_service.dart';
import 'package:oringe/module_change_pass/enums/pass_status.dart';
import 'package:oringe/module_change_pass/request/change_pass_request.dart';
import 'package:oringe/module_change_pass/service/change_pass_service.dart';
import 'package:oringe/module_change_pass/ui/screen/chnage_pass_screen.dart';
import 'package:oringe/module_change_pass/ui/state/chnage_init_state.dart';
import 'package:oringe/module_change_pass/ui/state/chnage_pass_state.dart';
import 'package:oringe/utils/helpers/custom_flushbar.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@injectable
class ChangePassStateManager {
  final AuthService _authService;
  final PasswordService _passwordService;


  ChangePassStateManager(this._authService, this._passwordService);

  final PublishSubject<ChangePassState> _loginStateSubject =
  PublishSubject<ChangePassState>();

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();


  Stream<ChangePassState> get stateStream => _loginStateSubject.stream;
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;


  void changePassword(ChangePassRequest request,ChangePassScreenState screenState){
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    if(request.oldPass != _authService.password){
      _loadingStateSubject.add(AsyncSnapshot.nothing());
      _loginStateSubject.add(ChangePassStateInit(screenState , error:S.current.wrongPass));
    }else {
    _passwordService.changePass(request).then((value) {
      if(value.hasError){
        _loginStateSubject.add(ChangePassStateInit(screenState , error: value.error ?? S.current.errorHappened));
      }else{
        screenState.goToLogin();
      }
    });
    }
  }

}