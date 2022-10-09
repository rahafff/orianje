import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:oringe/abstracts/states/loading_state.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:oringe/module_emploees/request/employee_filter_request.dart';
import 'package:oringe/module_emploees/state_manager/emplo_state_manager.dart';


@injectable
class EmployeesScreen extends StatefulWidget {
  final EmployeeStateManager _stateManager ;
  EmployeesScreen(this._stateManager);

  @override
  State<EmployeesScreen> createState() => EmployeesScreenState();
}

class EmployeesScreenState extends State<EmployeesScreen> {
  int groupValuePaid = -1;
  int groupValueSell = -1;
  late StreamSubscription _streamSubscription;
  late States currentState;
  EmployeeFilterRequest filterRequest =
  EmployeeFilterRequest( OrderByDescending: true,filterParameters: '');

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void getEmployees(){
    widget._stateManager.getEmployees(this, filterRequest);

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
    widget._stateManager.getEmployees(this, filterRequest);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      body: currentState.getUI(context),
    );
  }
}
