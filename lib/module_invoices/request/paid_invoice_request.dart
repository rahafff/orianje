class PaidInvoiceRequest {
  int? id;

  PaidInvoiceRequest(this.id);

  Map<String, String>  toJson() {
    final Map<String, String> data = <String, String>{};
    data['invoiceId'] = this.id.toString();
    return data;
  }
}
