import 'package:injectable/injectable.dart';
import 'package:oringe/abstracts/response/action_response.dart';
import 'package:oringe/consts/urls.dart';
import 'package:oringe/module_auth/service/auth_service/auth_service.dart';
import 'package:oringe/module_mails/request/create_mail_request.dart';
import 'package:oringe/module_mails/request/mails_filter_request.dart';
import 'package:oringe/module_mails/response/mails_details_response.dart';
import 'package:oringe/module_mails/response/mails_reponse.dart';
import 'package:oringe/module_network/http_client/http_client.dart';

@injectable
class MailsRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  MailsRepository(
      this._apiClient,
      this._authService,
      );

  Future<MailsGeneralData?> getMails(MailsFilterRequest request) async {
      var token = await _authService.getToken();
      request.clientID = await _authService.getClientID();
      dynamic response = await _apiClient.get(
        Urls.GET_MAILS,
        queryParams: request.toJson(),
        headers: {'Authorization': 'Bearer ' + '$token'},
      );
      if (response == null) return null;
      return MailsGeneralData.fromJson(response);
    }
  Future<MailsDetailsGeneralData?> getMailDetails(int id) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
      Urls.GET_MAIL_DETAILS,
      queryParams: {'id':id},
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return MailsDetailsGeneralData.fromJson(response);
  }
  Future<ActionResponse?> createMail(CreateMailRequest request) async {
    var token = await _authService.getToken();
    request.clientId = _authService.getClientID();
    dynamic response = await _apiClient.post(
      Urls.CREATE_MAIL,request.toJson(),
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return ActionResponse.fromJson(response);
  }
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