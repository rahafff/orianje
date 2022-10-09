import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:oringe/abstracts/states/loading_state.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_emploees/model/employee_model.dart';
import 'package:oringe/module_emploees/model/record_model.dart';
import 'package:oringe/module_emploees/request/create_employee_request.dart';
import 'package:oringe/module_emploees/request/employee_filter_request.dart';
import 'package:oringe/module_emploees/request/update_emp_request.dart';
import 'package:oringe/module_emploees/service/employee_service.dart';
import 'package:oringe/module_emploees/ui/screen/add_employe.dart';
import 'package:oringe/module_emploees/ui/screen/emp_record_screen.dart';
import 'package:oringe/module_emploees/ui/screen/employees_screen.dart';
import 'package:oringe/module_emploees/ui/state/employes_list_success.dart';
import 'package:oringe/module_emploees/ui/state/record_list_success.dart';
import 'package:oringe/utils/helpers/custom_flushbar.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tip_dialog/tip_dialog.dart';

@injectable
class EmployeeStateManager {
  final EmployeeService _service;

  final PublishSubject<States> _stateSubject = PublishSubject();
  Stream<States> get stateStream => _stateSubject.stream;

  EmployeeStateManager(this._service);

  Future<void> getEmployees(
      EmployeesScreenState screenState, EmployeeFilterRequest request) async {
    _stateSubject.add(LoadingState(screenState));
    var invoiceResult = await _service.getEmployees(request);
    if (invoiceResult.hasError) {
      _stateSubject.add(EmployeesListSuccess(screenState,
          employees: null, error: invoiceResult.error));
    } else if (invoiceResult.isEmpty) {
      _stateSubject
          .add(EmployeesListSuccess(screenState, employees: null, empty: true));
    } else {
      invoiceResult as EmployeeListModel;
      _stateSubject.add(EmployeesListSuccess(screenState,
          employees: invoiceResult.data?.employees));
    }
  }

  Future<void> createRecord(
      AddEmployeeScreenState screenState, CreateRecordRequest request) async {
    TipDialogHelper.loading("Loading");

    var invoiceResult = await _service.createRecord(request);
    if (invoiceResult.hasError) {
      TipDialogHelper.fail(invoiceResult.error ?? 'unKnowError');
    } else {
      TipDialogHelper.success("Loaded Successfully");
      TipDialogHelper.dismiss();
      Navigator.pop(screenState.context);
      CustomFlushBarHelper.createSuccess(
              title: S.current.warnning, message: 'Added successfully')
          .show(screenState.context);
    }
  }

  Future<void> updateRecord(
      EmployeeRecordScreenState screenState, UpdateRecordRequest request) async {

    _stateSubject.add(LoadingState(screenState));
    request.empId = screenState.id;
    var invoiceResult = await _service.updateRecord(request);
    if (invoiceResult.hasError) {
       getRecord(screenState, screenState.filterRequest);
    } else {
      getRecord(screenState, screenState.filterRequest);
      CustomFlushBarHelper.createSuccess(
          title: S.current.warnning, message: 'Updated successfully')
          .show(screenState.context);
    }
  }

  Future<void> getRecord(EmployeeRecordScreenState screenState,
      EmployeeRecordFilterRequest request) async {
    _stateSubject.add(LoadingState(screenState));
    var invoiceResult = await _service.getEmpRecord(request);
    if (invoiceResult.hasError) {
      _stateSubject.add(RecordListSuccess(screenState,
          records: null, error: invoiceResult.error));
    } else if (invoiceResult.isEmpty) {
      _stateSubject
          .add(RecordListSuccess(screenState, records: null, empty: true));
    } else {
      invoiceResult as RecordListModel;
      _stateSubject.add(RecordListSuccess(screenState,
          records: invoiceResult.data?.employees));
    }
  }
}
