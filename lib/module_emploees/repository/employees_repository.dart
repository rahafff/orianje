import 'package:injectable/injectable.dart';
import 'package:oringe/abstracts/response/action_response.dart';
import 'package:oringe/consts/urls.dart';
import 'package:oringe/module_auth/service/auth_service/auth_service.dart';
import 'package:oringe/module_emploees/request/create_employee_request.dart';
import 'package:oringe/module_emploees/request/employee_filter_request.dart';
import 'package:oringe/module_emploees/request/update_emp_request.dart';
import 'package:oringe/module_emploees/response/employee_reponse.dart';
import 'package:oringe/module_emploees/response/recored_reponse.dart';
import 'package:oringe/module_network/http_client/http_client.dart';

@injectable
class EmployeesRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  EmployeesRepository(
      this._apiClient,
      this._authService,
      );

  Future<EmployeeGeneralData?> getEmployees(EmployeeFilterRequest request) async {
      var token = await _authService.getToken();
      request.clientId = await _authService.getClientID();
      dynamic response = await _apiClient.get(
        Urls.GET_EMPLOYEES,
        queryParams: request.toJson(),
        headers: {'Authorization': 'Bearer ' + '$token'},
      );
      if (response == null) return null;
      return EmployeeGeneralData.fromJson(response);
    }

  Future<ActionResponse?> createEmployeeRecord(CreateRecordRequest request) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.post(
      Urls.CREATE_EMP_RECORD,request.toJson(),
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return ActionResponse.fromJson(response);
  }

  Future<ActionResponse?> updateEmployeeRecord(UpdateRecordRequest request) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.put(
      Urls.UPDATE_EMP_RECORD,request.toJson(),
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return ActionResponse.fromJson(response);
  }

  Future<RecordGeneralData?> getEmpRecord(EmployeeRecordFilterRequest request) async {
    var token = await _authService.getToken();
    request.clientId = await _authService.getClientID();
    dynamic response = await _apiClient.get(
      Urls.GET_EMPLOYEE_RECORD,
      queryParams: request.toJson(),
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return RecordGeneralData.fromJson(response);
  }
}