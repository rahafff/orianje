import 'dart:async';

import 'package:oringe/abstracts/states/loading_state.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:oringe/module_mails/request/mails_filter_request.dart';

import 'package:oringe/module_mails/state_manager/mails_state_manager.dart';


@injectable
class MailsListScreen extends StatefulWidget {
  final MailsStateManager _stateManager;
  MailsListScreen(this._stateManager);

  @override
  State<MailsListScreen> createState() => MailsScreenState();
}

class MailsScreenState extends State<MailsListScreen> {
  int groupValueSeen = -1;
  late StreamSubscription _streamSubscription;
  late States currentState;
  MailsFilterRequest filterRequest =
  MailsFilterRequest( OrderByDescending: true,filterParameters: '');

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void getMails(){
    widget._stateManager.getMails(this, filterRequest);

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
    widget._stateManager.getMails(this, filterRequest);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: currentState.getUI(context)
    );
  }
}
