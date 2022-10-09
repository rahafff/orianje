import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:comment_tree/data/comment.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:comment_tree/widgets/tree_theme_data.dart';
import 'package:oringe/abstracts/states/loading_state.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:oringe/module_messages/state_manager/mails_state_manager.dart';
import 'package:oringe/utils/images/images.dart';

@injectable
class MsgScreen extends StatefulWidget {
  final MsgStateManager _stateManager;
  MsgScreen(this._stateManager);

  @override
  State<MsgScreen> createState() => MsgScreenState();
}

class MsgScreenState extends State<MsgScreen> {
  int groupValueSeen = -1;
  late StreamSubscription _streamSubscription;
  late States currentState;


  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void getMsg(){
    widget._stateManager.getMsg(this,);

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
    widget._stateManager.getMsg(this,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: currentState.getUI(context)
    );
  }
}