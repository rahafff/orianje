import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:oringe/module_auth/ui/states/login_states/login_state.dart';
import 'package:oringe/module_auth/ui/widget/login_widgets/custom_field.dart';
import 'package:oringe/module_main_navigation/nav_routes.dart';
import 'package:oringe/utils/helpers/custom_flushbar.dart';
import 'package:oringe/utils/images/images.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widget/login_widgets/custem_button.dart';

class LoginStateInit extends LoginState {
  LoginStateInit(LoginScreenState screen, {String? error}) : super(screen) {
    if (error != null) {
      CustomFlushBarHelper.createError(
              title: S.current.warnning, message: error)
          .show(screen.context);
    }
  }
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  @override
  Widget getUI(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _loginKey,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: <Widget>[
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Image.asset(
                          ImageAsset.LOGIN,
                          width: 90,
                          height: 230,
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: 45,
                ),
                CustomLoginFormField(
                  hintText: S.of(context).username,
                  validator: true,
                  controller: usernameController,
                  preIcon: Icon(Icons.email),
                  borderRadius: 15,
                ),
                SizedBox(
                  height: 45,
                ),
                CustomLoginFormField(
                  hintText: S.of(context).password,
                  validator: true,
                  controller: passwordController,
                  password: true,
                  preIcon: Icon(Icons.password),
                  borderRadius: 15,
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                  buttonTab: () {
                    if (_loginKey.currentState!.validate()) {
                      screen.loginClient(
                          usernameController.text.trim(), passwordController.text.trim());
                    }
                  },
                  loading: screen.loadingSnapshot.connectionState ==
                      ConnectionState.waiting,
                  text: S.of(context).login,
                  bgColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Powered by ",
                              style: TextStyle(fontSize: 15, color: Colors.grey)
                          ),
                          TextSpan(
                            text: "Tello Technology",
                            style: TextStyle(
                              fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline
                            ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  if (await canLaunch("https://Tellotech.eu") == true) {
                                    launch("https://Tellotech.eu");
                                  } else {
                                    print("Can't launch URL");
                                  }
                                }
                          ),
                        ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
