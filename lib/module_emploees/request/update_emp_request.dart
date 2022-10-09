class UpdateRecordRequest {
  int? year;
  int? hours;
  int? days;
  int? month;
  int? empId;
  int? id;

  UpdateRecordRequest( { this.year, this.hours,
    this.days, this.month, this.empId,this.id});

  Map<String, dynamic>  toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['employeeId'] = this.empId;
    data['id'] = this.id;
    data['month'] = this.month;
    data['year'] = this.year;
    data['days'] = this.days;
    data['hours'] = this.hours;
    data['isActive'] = true;

    return data;
  }
}