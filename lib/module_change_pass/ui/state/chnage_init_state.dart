import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_auth/ui/widget/login_widgets/custem_button.dart';
import 'package:oringe/module_auth/ui/widget/login_widgets/custom_field.dart';
import 'package:oringe/module_change_pass/request/change_pass_request.dart';
import 'package:oringe/module_change_pass/ui/screen/chnage_pass_screen.dart';
import 'package:oringe/module_change_pass/ui/state/chnage_pass_state.dart';
import 'package:oringe/utils/helpers/custom_flushbar.dart';
import 'package:oringe/utils/images/images.dart';
import 'package:flutter/material.dart';

class ChangePassStateInit extends ChangePassState {
  ChangePassStateInit(ChangePassScreenState screen, {String? error}) : super(screen) {
    if (error != null) {
      CustomFlushBarHelper.createError(
          title: S.current.warnning, message: error)
          .show(screen.context);
    }
  }
  TextEditingController oldPassword = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  @override
  Widget getUI(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _loginKey,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: <Widget>[

//                CustomLoginFormField(
//                  hintText: S.of(context).oldPass,
//                  validator: true,
//                  controller: oldPassword,
//                  preIcon: Icon(Icons.email),
//                  borderRadius: 15,
//                ),
//
              Image.asset(ImageAsset.PASSWORD,height: 100),
                SizedBox(
                  height: 30,
                ),
                Text(S.of(context).oldPass),
                SizedBox(
                  height: 30,
                ),
               CustomLoginFormField(
                  hintText: S.of(context).oldPass,
                  validator: true,
                  controller: oldPassword,
                  preIcon: Icon(Icons.password),
                  borderRadius: 15,
                 password: true,
                ),
                SizedBox(
                  height: 20,
                ),
              Text(S.of(context).newPassword),
                SizedBox(
                  height: 30,
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
                      screen.changePass(ChangePassRequest(passwordController.text,oldPassword.text));
                    }
                  },
                  loading: screen.loadingSnapshot.connectionState ==
                      ConnectionState.waiting,
                  text: S.of(context).changePass,
                  bgColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}