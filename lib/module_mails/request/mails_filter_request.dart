
class MailsFilterRequest {
  int? clientID;
  int? skip;
  int? length;
  bool OrderByDescending;
 String filterParameters;

  MailsFilterRequest({this.clientID, this.skip, this.length,required this.OrderByDescending ,required this.filterParameters  });

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['clientId'] = this.clientID;
    data['skip'] = 0;
    data['length'] = 10000;
    data['OrderByDescending'] = this.OrderByDescending;
    data['filterParameters'] = filterParameters;

    return data;
  }
}
