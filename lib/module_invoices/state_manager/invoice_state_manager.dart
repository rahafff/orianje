import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:oringe/abstracts/states/loading_state.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_auth/service/auth_service/auth_service.dart';
import 'package:oringe/module_invoices/model/invoice_details_model.dart';
import 'package:oringe/module_invoices/model/invoice_model.dart';
import 'package:oringe/module_invoices/request/create_invoice_request.dart';
import 'package:oringe/module_invoices/request/invoice_request.dart';
import 'package:oringe/module_invoices/request/paid_invoice_request.dart';
import 'package:oringe/module_invoices/service/invoice_service.dart';
import 'package:oringe/module_invoices/ui/screen/add_invoice_screen.dart';
import 'package:oringe/module_invoices/ui/screen/invoice_details_screen.dart';
import 'package:oringe/module_invoices/ui/screen/invoices_screen.dart';
import 'package:oringe/module_invoices/ui/states/invoice_details_success.dart';
import 'package:oringe/module_invoices/ui/states/invoices_success.dart';
import 'package:oringe/module_upload/service/image_upload/image_upload_service.dart';
import 'package:oringe/utils/helpers/custom_flushbar.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tip_dialog/tip_dialog.dart';

@injectable
class InvoiceStateManager {
  final InvoicesService _service;
  final ImageUploadService _uploadService;

  final PublishSubject<States> _stateSubject = PublishSubject();
  Stream<States> get stateStream => _stateSubject.stream;

  InvoiceStateManager(
    this._service,
    this._uploadService,
  );

  Future<void> getInvoice(
      InvoiceScreenState screenState, InvoiceFilterRequest request) async {
    _stateSubject.add(LoadingState(screenState));
    var invoiceResult = await _service.getInvoices(request);
    if (invoiceResult.hasError) {
      _stateSubject.add(InvoicesSuccess(screenState,
          invoices: null, error: invoiceResult.error));
    } else if (invoiceResult.isEmpty) {
      _stateSubject
          .add(InvoicesSuccess(screenState, invoices: null, empty: true));
    } else {
      invoiceResult as InvoiceResultModel;
      _stateSubject.add(
          InvoicesSuccess(screenState, invoices: invoiceResult.data?.invoices));
    }
  }

  Future<void> getInvoiceDetails(
      InvoiceDetailsScreenState screenState, int id) async {
    _stateSubject.add(LoadingState(screenState));
    var invoiceResult = await _service.getInvoicesDetails(id);
    if (invoiceResult.hasError) {
      _stateSubject.add(InvoiceDetailsSuccess(screenState,
          detailsModel: null, error: invoiceResult.error));
    } else if (invoiceResult.isEmpty) {
      _stateSubject.add(
          InvoiceDetailsSuccess(screenState, detailsModel: null, empty: true));
    } else {
      invoiceResult as InvoiceDetailsModel;
      _stateSubject.add(
          InvoiceDetailsSuccess(screenState, detailsModel: invoiceResult.data));
    }
  }

  Future<void> createInvoice(AddInvoiceScreenState screenState,
      CreateInvoiceRequest request, AttachRequest? attachRequest) async {
    TipDialogHelper.loading("Loading");

    if (attachRequest != null) {
      await _uploadService.uploadImage(attachRequest.path).then((value) async {
        if (value != null) {
          attachRequest.path = value;

          request.attachment.add(attachRequest);

          print(request.attachment);
          print(attachRequest.path);

          var invoiceResult = await _service.createInvoice(request);
          if (invoiceResult.hasError) {
            TipDialogHelper.fail(invoiceResult.error ?? 'unKnowError');
          } else {
            TipDialogHelper.dismiss();
            Navigator.pop(screenState.context);
            CustomFlushBarHelper.createSuccess(
                    title: S.current.warnning, message: 'Added successfully')
                .show(screenState.context);
          }
        }
      });
    } else {
      var invoiceResult = await _service.createInvoice(request);
      if (invoiceResult.hasError) {
        TipDialogHelper.fail(invoiceResult.error ?? 'unKnowError');
      } else {
        TipDialogHelper.dismiss();
        Navigator.pop(screenState.context);
        CustomFlushBarHelper.createSuccess(
                title: S.current.warnning, message: 'Added successfully')
            .show(screenState.context);
      }
    }
  }

  Future<void> paidInvoice(PaidInvoiceRequest request, bool isPaid) async {
    TipDialogHelper.loading("Loading");

    if (isPaid) {
      var invoiceResult = await _service.paidInvoice(request);
      if (invoiceResult.hasError) {
        TipDialogHelper.fail(invoiceResult.error ?? 'unKnowError');
      } else {
        TipDialogHelper.success(S.current.paidSuccessfully);
        await Future.delayed(Duration(milliseconds: 5));
        TipDialogHelper.dismiss();
      }
    } else {
      var invoiceResult = await _service.unPaidInvoice(request);
      if (invoiceResult.hasError) {
        TipDialogHelper.fail(invoiceResult.error ?? 'unKnowError');
      } else {
        TipDialogHelper.success(S.current.unPaidSuccessfully);
        await Future.delayed(Duration(milliseconds: 5));
        TipDialogHelper.dismiss();
      }
    }
  }
}
