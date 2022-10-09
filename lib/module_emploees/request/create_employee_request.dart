class CreateRecordRequest {

  int? year;
  int? hours;
  int? days;
  int? month;
  int? empId;

  CreateRecordRequest( { this.year, this.hours,
      this.days, this.month, this.empId,});

  Map<String, dynamic>  toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['employeeId'] = this.empId;
    data['month'] = this.month;
    data['year'] = this.year;
    data['days'] = this.days;
    data['hours'] = this.hours;
    data['isActive'] = true;

    return data;
  }
}


