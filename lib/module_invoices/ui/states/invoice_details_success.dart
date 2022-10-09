import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_file_safe/open_file_safe.dart';

// import 'package:open_file/open_file.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_invoices/model/invoice_details_model.dart';
import 'package:oringe/module_invoices/ui/screen/invoice_details_screen.dart';
import 'package:oringe/module_invoices/widget/attach_card.dart';
import 'package:oringe/module_invoices/widget/custom_text.dart';
import 'package:oringe/utils/components/custom_container.dart';
import 'package:oringe/utils/components/empty_screen.dart';
import 'package:oringe/utils/components/error_screen.dart';
import 'package:oringe/utils/images/images.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tip_dialog/tip_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class InvoiceDetailsSuccess extends States {
  final InvoiceDetailsScreenState screenState;
  final InvoiceDetailsModel? detailsModel;
  final String? error;
  final bool empty;
  InvoiceDetailsSuccess(this.screenState,
      {this.detailsModel, this.error, this.empty = false})
      : super(screenState){
    paidLast = detailsModel!.isPayed;
  }
  bool? paidLast;
  @override
  Widget getUI(BuildContext context) {
    if (error != null) {
      return ErrorStateWidget(
        onRefresh: () {
//          screenState.getUsers(true,false);
        },
        error: error,
      );
    } else if (empty) {
      return EmptyStateWidget(
          empty: S.current.notSeen,
          onRefresh: () {
//           screenState.getUsers();
          });
    }
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomContainer(Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      title: S.of(context).supplierName,
                      body: detailsModel!.supplierName),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      title: S.of(context).invoiceNumber,
                      body: detailsModel!.invoiceNumber),
                  CustomText(
                      title: S.of(context).cashBookNumber,
                      body: detailsModel!.cashBookNumber),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      title: S.of(context).invoiceType,
                      body: detailsModel!.type == 0
                          ? S.of(context).sell
                          : S.of(context).buy),
                  Row(
                    children: [
                      Text(S.of(context).paid),
                      Checkbox(
                        value: paidLast,
                        onChanged: (v) {
                          if(v != null){
                            paidLast = v;
                            screenState.refresh();
                            screenState.paidInvoice(v);
                          }

                        },
                        activeColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10),
                child: Divider(
                  height: 2,
                  thickness: 2,
                ),
              ),
            ],
          ),
        )),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            S.of(context).attachments,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        detailsModel!.attachments.isNotEmpty
            ? CustomContainer(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                child: AttachCard(
                                  attachResponse:
                                      detailsModel!.attachments[index],
                                ),
                                onTap: () async {
                                  int randomNumber =   Random().nextInt(100);
                                  var status = await Permission.storage.status;
                                  if (!status.isGranted) {
                                    await Permission.storage.request().then((value) {
                                      if(value.isGranted) {
                                        downloadFile(
                                            detailsModel!
                                                .attachments[index].downloadPath
                                                .split('_app')
                                                .first,
                                            '$randomNumber'+detailsModel!.attachments[index].name);
                                      }
                                    });
                                  }
                                  else{
                                    downloadFile(
                                        detailsModel!
                                            .attachments[index].downloadPath
                                            .split('_app')
                                            .first,
                                        '$randomNumber'+detailsModel!.attachments[index].name);

                                  }
                                },
                              ),
                              Divider(
                                height: 2,
                                thickness: 2,
                              )
                            ],
                          );
                        },
                        itemCount: detailsModel?.attachments.length,
                        shrinkWrap: true),
                  ],
                ),
              )
            : Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Image.asset(
                      ImageAsset.NO_ATTACH,
                      height: 100,
                    ),
                    Text(
                      S.of(context).noAttachInvoice,
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
      ],
    ));
  }

    downloadFile(
    String url,
    String fileName,
  ) async {
    print('start download');
    TipDialogHelper.loading("waiting to download");

    String? dir = await getDownloadPath();
    HttpClient httpClient = new HttpClient();
    File file;
    String filePath = '';
    String myUrl = '';

    try {
      myUrl = url;
      print(myUrl);
      var request = await httpClient.getUrl(Uri.parse(myUrl));
      var response = await request.close();
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('inStatusCode');
        var bytes = await consolidateHttpClientResponseBytes(response);

        filePath = '$dir/$fileName';
        print('filePath' + filePath);
        file = File(filePath);
        await  file.writeAsBytes(bytes).then((value) {
            OpenFile.open(file.path);
          });

      } else{
        filePath = 'Error code: ' + response.statusCode.toString();
        TipDialogHelper.fail("fail downlod");
      }

    } catch (ex) {
//      filePath = 'Can not fetch url';
      print(ex);
//      OpenFile.open(filePath);
    }
    TipDialogHelper.dismiss();
//    return filePath;
  }

//  downloadTest(String url ) async {
//
//
////  var dir =  await getApplicationDocumentsDirectory();
////  FlutterDownloader.registerCallback(downloadCallback);
////    final taskId = await FlutterDownloader.enqueue(
////      url: url,
////      headers: {}, // optional: header send with url (auth token etc)
////      savedDir: dir.path,
////      showNotification: true, // show download progress in status bar (for Android)
////      openFileFromNotification: true, // click on notification to open downloaded file (for Android)
////    );
//  }
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
        // ignore: avoid_slow_async_io
        if (!await directory.exists())
          directory = await getExternalStorageDirectory();
      }
    } catch (err, stack) {
      print("Cannot get download folder path");
    }
    return directory?.path;
  }
}
