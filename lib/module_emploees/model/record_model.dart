import 'package:oringe/abstracts/data_model/data_model.dart';
import 'package:oringe/module_emploees/response/employee_reponse.dart';
import 'package:oringe/module_emploees/response/recored_reponse.dart';
import 'package:oringe/utils/helpers/status_code_helper.dart';


class RecordModel extends DataModel {
  num? days;
  String  month ='';
  int? year;
  num? hours;
  int? id;

  RecordModel(
      {required this.days,
      required this.month,
      this.year,
      this.hours,
        this.id
      });
}

class RecordListModel extends DataModel {
  int? totalCount;
  List<RecordModel>? employees;

  RecordListModel? _model;

  RecordListModel({required this.totalCount, required this.employees});

  RecordListModel.withData(RecordResult? data) : super.withData() {
    List<RecordModel>? _models;
    _models = <RecordModel>[];
    data?.data?.items?.forEach((element) {
      _models?.add(RecordModel(
          hours: element.hours,
          month: StatusCodeHelper.getMonthMessages (element.month ??-1),
          year: element.year ?? 0000,
          days: element.days ?? 0,
          id: element.id ?? -1,
      ));
    });

    _model =
        RecordListModel(totalCount: data?.totalCount ?? 0, employees: _models);
  }
  RecordListModel? get data => _model;
}
