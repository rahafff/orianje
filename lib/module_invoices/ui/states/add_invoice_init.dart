import 'dart:io';

import 'package:badges/badges.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_auth/ui/widget/login_widgets/custem_button.dart';
import 'package:oringe/module_invoices/request/create_invoice_request.dart';
import 'package:oringe/module_invoices/ui/screen/add_invoice_screen.dart';
import 'package:oringe/utils/components/custom_feild.dart';
import 'package:oringe/utils/components/custom_text_button.dart';
import 'package:oringe/utils/images/images.dart';
import 'package:image_picker/image_picker.dart';

class AddInvoiceInitState extends States {
  final AddInvoiceScreenState screenState;

  AddInvoiceInitState(this.screenState) : super(screenState);

  var _supplierNameController = TextEditingController();
  var _invoiceNumberController = TextEditingController();
  var _cachNumberController = TextEditingController();

  DateTime? _dateTime = DateTime.now();

  PlatformFile? _selectedFile ;
  AttachRequest? _attachRequest;

  final ImagePicker _picker = ImagePicker();
  final GlobalKey<FormState> _addInvoiceKey = GlobalKey<FormState>();
  @override
  Widget getUI(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _addInvoiceKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            CustomFormField(
              preIcon: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10, top: 12),
                child: Text(
                  S.of(context).invoiceNumber + '* ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              hintText: S.of(context).AddInvoiceNumber,
              validator: true,
              controller: _invoiceNumberController,
            ),
            CustomFormField(
                hintText: S.of(context).addCashBookNumber,
                preIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10, top: 12),
                  child: Text(
                    S.of(context).cashBookNumber + '* ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                controller: _cachNumberController),
            CustomFormField(
                hintText: S.of(context).AddSupplierName,
                preIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10, top: 12),
                  child: Text(
                    S.of(context).supplierName + '* ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                controller: _supplierNameController),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 8,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      children: [
//                        Padding(
//                          padding: const EdgeInsetsDirectional.only(start: 10),
//                          child: Text(
//                            'Payment *',
//                            style: TextStyle(
//                                fontSize: 14, fontWeight: FontWeight.w700),
//                          ),
//                        ),
//                        Flexible(
//                            child: RadioListTile(
//                              value: 1,
//                              groupValue: screenState.groupValuePaid,
//                              onChanged: (v) {
//                                screenState.groupValuePaid = v as int;
//                                screenState.refresh();
//                              },
//                              title: Text('Paid'),
//                              activeColor: Theme.of(context).primaryColor,
//                            ),
//                            fit: FlexFit.loose),
//                        Flexible(
//                            child: RadioListTile(
//                              value: 0,
//                              groupValue: screenState.groupValuePaid,
//                              onChanged: (v) {
//                                screenState.groupValuePaid = v as int;
//                                screenState.refresh();
//                              },
//                              title: Text('Not Paid'),
//                              activeColor: Theme.of(context).primaryColor,
//                            ),
//                            fit: FlexFit.loose),
//                      ],
//                    ),
//                    Divider(height: 2, thickness: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 10),
                          child: Text(
                            S.of(context).invoiceType + '* ',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Flexible(
                            child: RadioListTile(
                              value: 0,
                              groupValue: screenState.groupValueSell,
                              onChanged: (v) {
                                screenState.groupValueSell = v as int;
                                screenState.refresh();
                              },
                              title: Text(S.of(context).sell),
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            fit: FlexFit.loose),
                        Flexible(
                            child: RadioListTile(
                              value: 1,
                              groupValue: screenState.groupValueSell,
                              onChanged: (v) {
                                screenState.groupValueSell = v as int;
                                screenState.refresh();
                              },
                              title: Text(S.of(context).buy),
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            fit: FlexFit.loose),
                      ],
                    ),
                    Divider(height: 2, thickness: 2),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 10),
                            child: Text(
                              S.of(context).date + '* ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              _dateTime = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2025, 1, 1),
                              );

                              screenState.refresh();
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 10),
                              child: Text(
                                _dateTime!.toIso8601String().split('T').first,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // buttons
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    // extend subscription
                                    CustomTextButton(
                                      label: S.of(context).takePicture,
                                      onPressed: () async{
                                        Navigator.pop(context);
                                        XFile? photo = await _picker.pickImage(source: ImageSource.camera);
                                        if(photo !=null){
                                          PlatformFile photoTofile =
                                          PlatformFile(path: photo.path, name:photo.name, size: 500);
                                          _selectedFile = photoTofile;
                                          screenState.refresh();
                                        }

                                      },
                                    ),
                                    Divider(
                                      indent: 16,
                                      endIndent: 16,
                                      color: Theme.of(context).dividerColor,
                                      thickness: 2.5,
                                    ),
                                    // renew new subscription
                                    CustomTextButton(
                                      label: S.of(context).selectDoc,
                                      onPressed: () async {
                                        Navigator.pop(context);
                                    _selectedFile = await pickFile();
                                        screenState.refresh();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // close button
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: double.maxFinite,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      onSurface: Colors.white,
                                      primary: Colors.white),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      S.of(context).close,
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  )),
                            ),
                          )
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 8,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child:_selectedFile != null ?
                  (_selectedFile?.extension == 'png' ||_selectedFile?.extension == 'jpg' ) ?
                      InkWell(
                        onTap: (){
                          _selectedFile = null;
                          screenState.refresh();
                        },
                        child: Badge(
                            badgeContent: Icon(Icons.close,color: Colors.white,),
                            elevation: 5.0,
                            child: Image.file(File(_selectedFile!.path!),height: 200,)),
                      ) :
                  InkWell(
                    onTap: (){
                      _selectedFile = null;
                      screenState.refresh();
                    },
                    child: Badge(
                        badgeContent: Icon(Icons.close,color: Colors.white,),
                        elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(ImageAsset.DOC , height: 100,),
                            SizedBox(height: 10),
                            Text(_selectedFile?.name ?? '')
                          ],
                        ),
                      ),
                    ),
                  )
                 : Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Icon(Icons.add_a_photo),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                buttonTab: () {
                  if (_addInvoiceKey.currentState!.validate()) {
                    if(_selectedFile != null){
                      _attachRequest  =  AttachRequest(_selectedFile?.name, _selectedFile?.extension, _selectedFile?.path);
                    }
                    screenState.createInvoice(CreateInvoiceRequest(
                      type: screenState.groupValueSell,
                      date: _dateTime!.toIso8601String(),
                      invoiceNumber: _invoiceNumberController.text,
                      supplierName: _supplierNameController.text,
                      cashbookNumber: _cachNumberController.text,
                      attachment: []
                    ),
                       _attachRequest
                    );
                  }
                },
                loading: false,
                text: S.of(context).addInvoice,
                bgColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<PlatformFile?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf', 'doc'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;

      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);

      return file;
    } else {
      // User canceled the picker
      return null;
    }
  }
}
