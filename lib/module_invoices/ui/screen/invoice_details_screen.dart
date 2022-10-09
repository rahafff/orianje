import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:oringe/abstracts/states/loading_state.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_invoices/request/paid_invoice_request.dart';
import 'package:oringe/module_invoices/state_manager/invoice_state_manager.dart';
import 'package:tip_dialog/tip_dialog.dart';

@injectable
class InvoiceDetailsScreen extends StatefulWidget {
  final InvoiceStateManager _stateManager;

  InvoiceDetailsScreen(this._stateManager);

  @override
  InvoiceDetailsScreenState createState() => InvoiceDetailsScreenState();
}

class InvoiceDetailsScreenState extends State<InvoiceDetailsScreen> {
  int id = -1;
  bool flags = true;
  late StreamSubscription _streamSubscription;
  late States currentState;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void getInvoices() {
    widget._stateManager.getInvoiceDetails(this, id);
  }

  void paidInvoice(bool isPaid){
    widget._stateManager.paidInvoice(PaidInvoiceRequest(id), isPaid);
  }

  @override
  void initState() {
    super.initState();
    currentState = LoadingState(this);
    _streamSubscription = widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && flags) {
      if (args is int) id = args;
      widget._stateManager.getInvoiceDetails(this, id);
      flags = false;
    }
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          surfaceTintColor: Colors.grey.shade200,
          centerTitle: true,
          elevation: 5,
          title: Text(S.of(context).invoices,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
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
