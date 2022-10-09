import 'package:injectable/injectable.dart';
import 'package:oringe/abstracts/data_model/data_model.dart';
import 'package:oringe/abstracts/response/action_response.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_emploees/model/employee_model.dart';
import 'package:oringe/module_emploees/model/record_model.dart';
import 'package:oringe/module_emploees/repository/employees_repository.dart';
import 'package:oringe/module_emploees/request/create_employee_request.dart';
import 'package:oringe/module_emploees/request/employee_filter_request.dart';
import 'package:oringe/module_emploees/request/update_emp_request.dart';
import 'package:oringe/module_emploees/response/employee_reponse.dart';
import 'package:oringe/module_emploees/response/recored_reponse.dart';

@injectable
class EmployeeService {
  final EmployeesRepository _manager;

  EmployeeService(this._manager);

  Future<DataModel> getEmployees(EmployeeFilterRequest request) async {
    EmployeeGeneralData? _response = await _manager.getEmployees(request);
    if (_response == null) {
      return DataModel.withError(S.current.networkError);
    }
    if ( !_response.success) {
      return DataModel.withError(_response.error?.message);
    }
    print('ressssosososo');
    print(_response.result);
    return EmployeeListModel.withData(_response.result);
  }

  Future<DataModel> getEmpRecord(EmployeeRecordFilterRequest request) async {
    RecordGeneralData? _response = await _manager.getEmpRecord(request);
    if (_response == null) {
      return DataModel.withError(S.current.networkError);
    }
    if ( !_response.success) {
      return DataModel.withError(_response.error?.message);
    }
    print('ressssosososo');
    print(_response.result);
    return RecordListModel.withData(_response.result);
  }

  Future<DataModel> createRecord(CreateRecordRequest request) async {
    ActionResponse? _response = await _manager.createEmployeeRecord(request);
    if (_response == null) {
      return DataModel.withError(S.current.networkError);
    }
    if ( !_response.success) {
      return DataModel.withError(_response.errorObj?.message);
    }
    print('ressssosososo');
//    print(_response.result);
    return DataModel.withData();
  }

  Future<DataModel> updateRecord(UpdateRecordRequest request) async {
    ActionResponse? _response = await _manager.updateEmployeeRecord(request);
    if (_response == null) {
      return DataModel.withError(S.current.networkError);
    }
    if ( !_response.success) {
      return DataModel.withError(_response.errorObj?.message);
    }
    print('ressssosososo');
//    print(_response.result);
    return DataModel.withData();
  }
}