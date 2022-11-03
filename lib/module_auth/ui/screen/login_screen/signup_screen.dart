import 'dart:async';
import 'package:oringe/module_auth/state_manager/login_state_manager/signup_state_manager.dart';
import 'package:oringe/module_auth/ui/states/login_states/login_state.dart';
import 'package:oringe/module_auth/ui/states/login_states/signup_state_init.dart';
import 'package:oringe/utils/components/fixed_container.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpScreen extends StatefulWidget {
  final SignUpStateManager _stateManager;

  SignUpScreen(this._stateManager);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  late SignUpState _currentStates;
  late AsyncSnapshot loadingSnapshot;
  late StreamSubscription _stateSubscription;

  final _recipientController = TextEditingController(
    text: 'rahaf_tanous@hotmail.com',
  );

  final _subjectController = TextEditingController(text: 'The subject');

  final _bodyController = TextEditingController(
    text: 'Mail body.',
  );


  void refresh() {
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    loadingSnapshot = AsyncSnapshot.nothing();
    _currentStates = SignUpStateInit(this);
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

  bool argsF = false;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args != null) {
      argsF = true;
    }
    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
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

  void signUpClient(String userName ,String email, String password)  {
    widget._stateManager.signUpClient(userName, email, password, this);
   // await Future.delayed(Duration(seconds: 1));
    // loadingSnapshot = AsyncSnapshot.nothing();
    // showSuccessAlter();
  }

  void showSuccessAlter() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Successfully'),
        content: Text('Thank you , Your information will be verified and your account activated within half an hour '),
        actions: [InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Text('OK'))],
      ),
    );
  }

}
