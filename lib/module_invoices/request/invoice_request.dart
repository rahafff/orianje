class InvoiceFilterRequest {
  int? clientID;
  int? skip;
  int? length;
  bool OrderByDescending;
 String filterParameters;

  InvoiceFilterRequest({this.clientID, this.skip, this.length,required this.OrderByDescending ,required this.filterParameters  });

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
//class InvoiceFilterParams {
//  String? invoiceNumber;
//  String? cashbookNumber;
//  String? supplierName;
//  bool? isPaid;
//
//  InvoiceFilterParams({this.invoiceNumber, this.cashbookNumber, this.supplierName,  this.isPaid  });
//
//  Map<String, dynamic>? toJson() {
//    final Map<String, dynamic> data = <String, dynamic>{};
//
//    data['invoiceNumber'] = this.invoiceNumber;
////    data['cashbookNumber'] = 0;
////    data['supplierName'] = 10000;
////    data['isPaid'] = this.isPaid;
////    data['filterParameters'] = 'invoiceNumber=454544555';
//
//    return data;
//  }
//}