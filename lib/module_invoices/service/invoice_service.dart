import 'package:injectable/injectable.dart';
import 'package:oringe/abstracts/data_model/data_model.dart';
import 'package:oringe/abstracts/response/action_response.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_invoices/model/invoice_details_model.dart';
import 'package:oringe/module_invoices/model/invoice_model.dart';
import 'package:oringe/module_invoices/repository/invoice_repository.dart';
import 'package:oringe/module_invoices/request/create_invoice_request.dart';
import 'package:oringe/module_invoices/request/invoice_request.dart';
import 'package:oringe/module_invoices/request/paid_invoice_request.dart';
import 'package:oringe/module_invoices/response/attach_response.dart';
import 'package:oringe/module_invoices/response/invoice_reponse.dart';


@injectable
class InvoicesService {
  final InvoiceRepository _manager;

  InvoicesService(this._manager);

  Future<DataModel> getInvoices(InvoiceFilterRequest request) async {
    InvoiceGeneralData? _response = await _manager.getInvoices(request);
    if (_response == null) {
      return DataModel.withError(S.current.networkError);
    }
    if ( !_response.success) {
      return DataModel.withError(_response.error?.message);
    }
    print('ressssosososo');
    print(_response.result);
    return InvoiceResultModel.withData(_response.result);
  }

  Future<DataModel> getInvoicesDetails(int id) async {
    InvoiceDetailsGeneralData? _response = await _manager.getInvoiceDetails(id);
    if (_response == null) {
      return DataModel.withError(S.current.networkError);
    }
    if ( !_response.success) {
      return DataModel.withError(_response.error?.message);
    }
    print('ressssosososo');
    print(_response.result);
    return InvoiceDetailsModel.withData(_response.result!.data!);
  }


  Future<DataModel> createInvoice(CreateInvoiceRequest request) async {
    ActionResponse? _response = await _manager.createInvoice(request);
    if (_response == null) {
      return DataModel.withError(S.current.networkError);
    }
    if ( !_response.success) {
      return DataModel.withError(_response.errorObj?.message);
    }
    print('ressssosososo');
//    print(_response.result);
    return DataModel.withData();
  }

  Future<DataModel> paidInvoice(PaidInvoiceRequest request) async {
    ActionResponse? _response = await _manager.paidInvoice(request);
    if (_response == null) {
      return DataModel.withError(S.current.networkError);
    }
    if ( !_response.success) {
      print('errroorrr');
      return DataModel.withError(_response.errorObj?.message);
    }
    print('ressssosososo');
//    print(_response.result);
    return DataModel.withData();
  }

  Future<DataModel> unPaidInvoice(PaidInvoiceRequest request) async {
    ActionResponse? _response = await _manager.unPaidInvoice(request);
    if (_response == null) {
      return DataModel.withError(S.current.networkError);
    }
    if ( !_response.success) {
      print('errroorrr');
      return DataModel.withError(_response.errorObj?.message);
    }
    print('ressssosososo');
//    print(_response.result);
    return DataModel.withData();
  }
}