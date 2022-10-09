class EmployeeFilterRequest {
  int? clientId;
  int? skip;
  int? length;
  bool OrderByDescending;
 String filterParameters;

  EmployeeFilterRequest({this.clientId,  this.skip, this.length,required this.OrderByDescending ,required this.filterParameters  });

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['skip'] = 0;
    data['clientId'] = clientId;
    data['length'] = 10000;
    data['OrderByDescending'] = this.OrderByDescending;
    data['filterParameters'] = filterParameters;

    return data;
  }
}
class EmployeeRecordFilterRequest {
  int? empId;
  int? clientId;
  int? skip;
  int? length;
  bool OrderByDescending;
 String filterParameters;

  EmployeeRecordFilterRequest({
    this.clientId,
    this.empId, this.skip, this.length,required this.OrderByDescending ,required this.filterParameters  });

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['skip'] = 0;
    data['length'] = 10000;
    data['OrderByDescending'] = this.OrderByDescending;
    data['filterParameters'] = 'employeeId=' +this.empId.toString() ;
    data['employeeId'] = empId;
    data['clientId'] = clientId;

    return data;
  }
}
