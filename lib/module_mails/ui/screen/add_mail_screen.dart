import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_invoices/request/create_invoice_request.dart';
import 'package:oringe/module_invoices/state_manager/invoice_state_manager.dart';
import 'package:oringe/module_invoices/ui/states/add_invoice_init.dart';
import 'package:oringe/module_mails/model/file_type.dart';
import 'package:oringe/module_mails/request/create_mail_request.dart';
import 'package:oringe/module_mails/state_manager/mails_state_manager.dart';
import 'package:oringe/module_mails/ui/states/add_mail_init.dart';
import 'package:tip_dialog/tip_dialog.dart';

@injectable
class AddMailScreen extends StatefulWidget {
  final MailsStateManager _stateManager;

  AddMailScreen(this._stateManager);

  @override
  AddMailScreenState createState() => AddMailScreenState();
}

class AddMailScreenState extends State<AddMailScreen> {
  MailType? dropdownvalue ;

  bool flags = true;
  late StreamSubscription _streamSubscription;
  late States currentState;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void createMail(CreateMailRequest request,AttachRequest? attachRequest) {
    widget._stateManager.createMail(this, request , attachRequest);
  }

  @override
  void initState() {
    super.initState();

    currentState = AddMailInitState(this);
    _streamSubscription = widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          surfaceTintColor: Colors.grey.shade200,
          centerTitle: true,
          elevation: 5,
//          shape: ShapeBorder.,
          title: Text(S.of(context).addMail,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
          actions: [
//            Padding(
//              padding: const EdgeInsetsDirectional.only(end: 30),
//              child: Icon(
//                Icons.check,
//                size: 30,
//              ),
//            )
          ],
        ),
        body: Stack(
          children: [
            currentState.getUI(context),
            TipDialogContainer(
                duration: const Duration(seconds: 2),
                outsideTouchable: true,
                onOutsideTouch: (Widget tipDialog) {
                  if (tipDialog is TipDialog &&
                      tipDialog.type == TipDialogType.LOADING) {
                    TipDialogHelper.dismiss();
                  }
                })

          ],
        ));
  }
}
