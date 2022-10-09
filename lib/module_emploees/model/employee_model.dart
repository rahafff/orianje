import 'package:oringe/abstracts/data_model/data_model.dart';
import 'package:oringe/module_emploees/response/employee_reponse.dart';


class EmployeeModel extends DataModel {
  int? id;
  String? fullName;
  String? email;
  String? phone;

  EmployeeModel(
      {required this.id,
      required this.fullName,
      this.email,
      this.phone,
      });
}

class EmployeeListModel extends DataModel {
  int? totalCount;
  List<EmployeeModel>? employees;

  EmployeeListModel? _model;

  EmployeeListModel({required this.totalCount, required this.employees});

  EmployeeListModel.withData(EmpResult? data) : super.withData() {
    List<EmployeeModel>? _models;
    _models = <EmployeeModel>[];
    data?.data?.items?.forEach((element) {
      _models?.add(EmployeeModel(
          id: element.id,
          fullName: element.fullName ?? '',
          email: element.email ?? '',
          phone: element.phone ?? 'unKnow',
      ));
    });

    _model =
        EmployeeListModel(totalCount: data?.totalCount ?? 0, employees: _models);
  }
  EmployeeListModel? get data => _model;
}
