import 'package:oringe/module_change_pass/ui/screen/chnage_pass_screen.dart';
import 'package:flutter/material.dart';

abstract class ChangePassState {
  final ChangePassScreenState screen;
  ChangePassState(this.screen);

  Widget getUI(BuildContext context);
}