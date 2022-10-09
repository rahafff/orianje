import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:oringe/abstracts/states/loading_state.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_emploees/employee_routes.dart';
import 'package:oringe/module_emploees/request/employee_filter_request.dart';
import 'package:oringe/module_emploees/request/update_emp_request.dart';
import 'package:oringe/module_emploees/state_manager/emplo_state_manager.dart';

@injectable
class EmployeeRecordScreen extends StatefulWidget {
  final EmployeeStateManager _stateManager;
  EmployeeRecordScreen(this._stateManager);

  @override
  State<EmployeeRecordScreen> createState() => EmployeeRecordScreenState();
}

class EmployeeRecordScreenState extends State<EmployeeRecordScreen> {
  bool flags = true;
  int id = -1;
  late StreamSubscription _streamSubscription;
  late States currentState;
  late EmployeeRecordFilterRequest filterRequest;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void getRecord() {
    widget._stateManager.getRecord(this, filterRequest);
  }

  void updateRecord(UpdateRecordRequest request) {
    widget._stateManager.updateRecord(this, request);
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
      filterRequest = EmployeeRecordFilterRequest(
          OrderByDescending: true, filterParameters: '', empId: id);
      widget._stateManager.getRecord(this, filterRequest);
      flags = false;
    }
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        surfaceTintColor: Colors.grey.shade200,
        centerTitle: true,
        elevation: 5,
        title: Text(S.of(context).records,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
        actions: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(
                context, EmployeeRoutes.ADD_EMPLOYEE , arguments: id);
          },
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 30),
            child: Icon(
              Icons.add_circle,
              size: 30,
            ),
          ),
        ),
      ],),
      body: currentState.getUI(context),
    );
  }
}
