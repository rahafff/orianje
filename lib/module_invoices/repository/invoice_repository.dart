import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:injectable/injectable.dart';
import 'package:oringe/abstracts/response/action_response.dart';
import 'package:oringe/consts/urls.dart';
import 'package:oringe/module_auth/service/auth_service/auth_service.dart';
import 'package:oringe/module_invoices/request/create_invoice_request.dart';
import 'package:oringe/module_invoices/request/invoice_request.dart';
import 'package:oringe/module_invoices/request/paid_invoice_request.dart';
import 'package:oringe/module_invoices/response/attach_response.dart';
import 'package:oringe/module_invoices/response/invoice_reponse.dart';
import 'package:oringe/module_network/http_client/http_client.dart';

@injectable
class InvoiceRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  InvoiceRepository(
      this._apiClient,
      this._authService,
      );

  Future<InvoiceGeneralData?> getInvoices(InvoiceFilterRequest request) async {
      var token = await _authService.getToken();
      request.clientID = await _authService.getClientID();
      dynamic response = await _apiClient.get(
        Urls.GET_INVOICES,
        queryParams: request.toJson(),
        headers: {'Authorization': 'Bearer ' + '$token'},
      );
      if (response == null) return null;
      return InvoiceGeneralData.fromJson(response);
    }
  Future<InvoiceDetailsGeneralData?> getInvoiceDetails(int id) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
      Urls.GET_INVOICE_DETAILS,
      queryParams: {'id':id},
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return InvoiceDetailsGeneralData.fromJson(response);
  }
  Future<ActionResponse?> createInvoice(CreateInvoiceRequest request) async {
    var token = await _authService.getToken();
    request.clientId = await _authService.getClientID();
    dynamic response = await _apiClient.post(
      Urls.CREATE_INVOICE,request.toJson(),
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return ActionResponse.fromJson(response);
  }

  Future<ActionResponse?> paidInvoice(PaidInvoiceRequest request) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.post(
      Urls.PAID_INVOICE,{},
      queryParams: request.toJson(),
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return ActionResponse.fromJson(response);
  }
  Future<ActionResponse?> unPaidInvoice(PaidInvoiceRequest request) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.post(
      Urls.UNPAID_INVOICE,{},
      queryParams: request.toJson(),
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return ActionResponse.fromJson(response);
  }

//  Future<ActionResponse?> uploadFile(CreateInvoiceRequest request) async {
//    var token = await _authService.getToken();
//    request.clientId = _authService.getClientID();
//    dynamic response = await _apiClient.post(
//      Urls.CREATE_INVOICE,request.toJson(),
//      headers: {'Authorization': 'Bearer ' + '$token'},
//    );
//    if (response == null) return null;
//    return ActionResponse.fromJson(response);
//  }


//  Future<ActionResponse?> addStudentAttach() async {
//    Dio client = Dio();
//    var token = await _authService.getToken();
////    print(request.imagePath);
////    File out = await ImageCompression.compressAndGetFile(file: File(request.imagePath ?? ''));
////    request.imagePath = await dio.MultipartFile.fromFile(out.path);
//
////    print(out.path);
//
//    var jsonVar = request.toJson();
////    jsonVar.addAll({'mobile' : 1});
//    FormData dataD =   dio.FormData.fromMap(jsonVar);
//    print(jsonVar);
//    print(Urls.UPLOAD_ATTACHMENT);
//
//    try{
//      dynamic response = await client.post(
//          Urls.UPLOAD_ATTACHMENT,
//          data:dataD ,
//          options:  Options(headers:{'Authorization': 'Bearer ' + '$token'})
//      );
//      print(response);
//      if (response == null) return null;
//      return ActionResponse.fromJson(response.data);
//    }catch(error){
//      print(error);
//    }
//  }


}