
import 'package:oringe/abstracts/module/yes_module.dart';
import 'package:injectable/injectable.dart';
import 'package:oringe/module_emploees/employee_routes.dart';
import 'package:oringe/module_emploees/ui/screen/add_employe.dart';
import 'package:oringe/module_emploees/ui/screen/emp_record_screen.dart';
import 'ui/screen/employees_screen.dart';

@injectable
class EmployeeModule extends YesModule {
  final AddEmployeeScreen _addEmployeeScreen;
  final EmployeesScreen _employeesScreen;
  final EmployeeRecordScreen _employeeRecordScreen;
  EmployeeModule(this._addEmployeeScreen, this._employeesScreen , this._employeeRecordScreen) {
    YesModule.RoutesMap.addAll({
      EmployeeRoutes.ADD_EMPLOYEE: (context) => _addEmployeeScreen,
      EmployeeRoutes.VIEW_EMPLOYEES: (context) => _employeesScreen,
      EmployeeRoutes.VIEW_RECORD: (context) => _employeeRecordScreen,
    });
  }
}
