import 'dart:async';

import 'package:oringe/di/di_config.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_auth/authorization_routes.dart';
import 'package:oringe/module_auth/service/auth_service/auth_service.dart';
import 'package:oringe/module_change_pass/request/change_pass_request.dart';
import 'package:oringe/module_change_pass/state_manager/chnage_pass_state_manager.dart';
import 'package:oringe/module_change_pass/ui/state/chnage_init_state.dart';
import 'package:oringe/module_change_pass/ui/state/chnage_pass_state.dart';
import 'package:oringe/utils/components/fixed_container.dart';
import 'package:oringe/utils/helpers/custom_flushbar.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePassScreen extends StatefulWidget {
  final ChangePassStateManager _stateManager;

  ChangePassScreen(this._stateManager);

  @override
  ChangePassScreenState createState() => ChangePassScreenState();
}

class ChangePassScreenState extends State<ChangePassScreen> {
  late ChangePassState _currentStates;
  late AsyncSnapshot loadingSnapshot;
  late StreamSubscription _stateSubscription;

  void refresh() {
    if (mounted) setState(() {});
  }


  @override
  void initState() {
    loadingSnapshot = AsyncSnapshot.nothing();
    _currentStates = ChangePassStateInit(this);
    _stateSubscription = widget._stateManager.stateStream.listen((event) {
      if (mounted) {
        setState(() {
          _currentStates = event;
        });
      }
    });
    widget._stateManager.loadingStream.listen((event) {
      if (this.mounted) {
        setState(() {
          loadingSnapshot = event;
        });
      }
    });
    super.initState();
  }

  dynamic args;
  @override
  Widget build(BuildContext context) {
//    args = ModalRoute.of(context)?.settings.arguments;
//    if (args != null) {
//      if (args is bool) returnToPreviousScreen = args;
//      if (args is int) returnToMainScreen = args;
//    }
    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          surfaceTintColor: Colors.grey.shade200,
          centerTitle: true,
          elevation: 5,
          title: Text(S.of(context).changePass,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
        ),
         body: FixedContainer(
          child: loadingSnapshot.connectionState != ConnectionState.waiting
              ? _currentStates.getUI(context)
              : Stack(
            children: [
              _currentStates.getUI(context),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _stateSubscription.cancel();
    super.dispose();
  }

  void changePass(ChangePassRequest request) {
    widget._stateManager.changePassword(request , this);
  }

  void goToLogin(){
    getIt<AuthService>().logout().then((value) {
      Navigator.pushNamedAndRemoveUntil(context, AuthorizationRoutes.LOGIN_SCREEN, (route) => false);
      CustomFlushBarHelper.createSuccess(
          title: S.current.warnning, message:  'change success')
          .show(context);
    });
  }
}
