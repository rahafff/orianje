import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:oringe/abstracts/states/loading_state.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:oringe/module_invoices/request/invoice_request.dart';
import 'package:oringe/module_invoices/state_manager/invoice_state_manager.dart';

@injectable
class InvoiceScreen extends StatefulWidget {
  final InvoiceStateManager _stateManager;
  InvoiceScreen(this._stateManager);

  @override
  State<InvoiceScreen> createState() => InvoiceScreenState();
}

class InvoiceScreenState extends State<InvoiceScreen> {
  int groupValuePaid = -1;
  int groupValueSell = -1;
  late StreamSubscription _streamSubscription;
  late States currentState;
  InvoiceFilterRequest filterRequest =
      InvoiceFilterRequest( OrderByDescending: true,filterParameters: '');

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

 void getInvoices()  {
     widget._stateManager.getInvoice(this, filterRequest);

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
    widget._stateManager.getInvoice(this, filterRequest);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: currentState.getUI(context),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }
}
