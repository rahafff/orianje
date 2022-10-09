import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:oringe/abstracts/states/loading_state.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_invoices/request/create_invoice_request.dart';
import 'package:oringe/module_mails/model/mails_details_model.dart';
import 'package:oringe/module_mails/model/mails_model.dart';
import 'package:oringe/module_mails/request/create_mail_request.dart';
import 'package:oringe/module_mails/request/mails_filter_request.dart';
import 'package:oringe/module_mails/service/mail_service.dart';
import 'package:oringe/module_mails/ui/screen/add_mail_screen.dart';
import 'package:oringe/module_mails/ui/screen/mail_details_screen.dart';
import 'package:oringe/module_mails/ui/screen/mails_list_screen.dart';
import 'package:oringe/module_mails/ui/states/mail_details_sucess.dart';
import 'package:oringe/module_mails/ui/states/mails_list_success.dart';
import 'package:oringe/module_upload/service/image_upload/image_upload_service.dart';
import 'package:oringe/utils/helpers/custom_flushbar.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tip_dialog/tip_dialog.dart';

@injectable
class MailsStateManager {
  final MailsService _service;
  final ImageUploadService _uploadService;

  final PublishSubject<States> _stateSubject = PublishSubject();
  Stream<States> get stateStream => _stateSubject.stream;


  MailsStateManager(this._service, this._uploadService);

  Future<void> getMails(MailsScreenState screenState,MailsFilterRequest request) async{
      _stateSubject.add(LoadingState(screenState));
    var invoiceResult = await  _service.getMails(request);
    if (invoiceResult.hasError) {
      _stateSubject.add(
          MailsStateSuccess(screenState,mails: null,error: invoiceResult.error));
    } else if(invoiceResult.isEmpty) {
      _stateSubject.add(MailsStateSuccess(screenState ,mails: null , empty: true));
    }
    else{
      invoiceResult as MailsResultModel;
      _stateSubject.add(MailsStateSuccess(screenState ,mails: invoiceResult.data?.mails ));
    }
  }

  Future<void> getMailDetails(MailDetailsScreenState screenState,int id ) async{
    _stateSubject.add(LoadingState(screenState));
    var invoiceResult = await  _service.getMailDetails(id);
    if (invoiceResult.hasError) {
      _stateSubject.add(
          MailDetailsSuccess(screenState,detailsModel: null,error: invoiceResult.error));
    } else if(invoiceResult.isEmpty) {
      _stateSubject.add(MailDetailsSuccess(screenState ,detailsModel: null , empty: true));
    }
    else{
      invoiceResult as MailsDetailsModel;
      _stateSubject.add(MailDetailsSuccess(screenState ,detailsModel: invoiceResult.data ));
    }
  }


  Future<void> createMail(AddMailScreenState screenState,
      CreateMailRequest request, AttachRequest? attachRequest) async {
    TipDialogHelper.loading("Loading");

    if(attachRequest != null){
      await  _uploadService.uploadImage(attachRequest.path).then((value) async {
        if (value != null) {
          attachRequest.path = value;

          request.attachment.add(attachRequest);

          print(request.attachment);
          print(attachRequest.path);

          var invoiceResult = await _service.createMail(request);
          if (invoiceResult.hasError) {
            TipDialogHelper.fail(invoiceResult.error ?? 'unKnowError');
          } else {
            TipDialogHelper.dismiss();
            Navigator.pop(screenState.context);
            CustomFlushBarHelper.createSuccess(
                title: S.current.warnning,  message: 'Added successfully')
                .show(screenState.context);
          }
        }
      });


    }else {
      var invoiceResult = await _service.createMail(request);
      if (invoiceResult.hasError) {
        TipDialogHelper.fail(invoiceResult.error ?? 'unKnowError');
      } else {
        TipDialogHelper.dismiss();
        Navigator.pop(screenState.context);
        CustomFlushBarHelper.createSuccess(
            title: S.current.warnning,  message: 'Added successfully')
            .show(screenState.context);
      }
    }

  }
}