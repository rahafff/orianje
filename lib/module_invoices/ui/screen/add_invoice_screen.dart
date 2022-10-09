import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_invoices/request/create_invoice_request.dart';
import 'package:oringe/module_invoices/state_manager/invoice_state_manager.dart';
import 'package:oringe/module_invoices/ui/states/add_invoice_init.dart';
import 'package:tip_dialog/tip_dialog.dart';

@injectable
class AddInvoiceScreen extends StatefulWidget {
  final InvoiceStateManager _stateManager;

  AddInvoiceScreen(this._stateManager);

  @override
  AddInvoiceScreenState createState() => AddInvoiceScreenState();
}

class AddInvoiceScreenState extends State<AddInvoiceScreen> {
  int groupValuePaid = 1;
  int groupValueSell = 1;

  int id = -1;
  bool flags = true;
  late StreamSubscription _streamSubscription;
  late States currentState;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void createInvoice(CreateInvoiceRequest request,AttachRequest? attachRequest) {
    widget._stateManager.createInvoice(this, request , attachRequest);
  }

  @override
  void initState() {
    super.initState();
    currentState = AddInvoiceInitState(this);
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
          title: Text(S.of(context).addInvoice,
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
