import 'dart:io';

import 'package:badges/badges.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_auth/ui/widget/login_widgets/custem_button.dart';
import 'package:oringe/module_invoices/request/create_invoice_request.dart';
import 'package:oringe/module_mails/model/file_type.dart';
import 'package:oringe/module_mails/request/create_mail_request.dart';
import 'package:oringe/module_mails/ui/screen/add_mail_screen.dart';
import 'package:oringe/utils/components/custom_container.dart';
import 'package:oringe/utils/components/custom_feild.dart';
import 'package:oringe/utils/components/custom_text_button.dart';
import 'package:oringe/utils/images/images.dart';

class AddMailInitState extends States {
  final AddMailScreenState screenState;

  AddMailInitState(this.screenState) : super(screenState);

  var _mailNumberController = TextEditingController();
  var _mailNameController = TextEditingController();
  DateTime? _dateTime = DateTime.now();

  PlatformFile? _selectedFile ;
  AttachRequest? _attachRequest;
  final GlobalKey<FormState> _addInvoiceKey = GlobalKey<FormState>();

  List<MailType> types = [
    MailType(0 , 'Img'),
    MailType(1 , 'Zip'),
    MailType(2 , 'Pdf'),
    MailType(3 , 'Photoshop'),
    MailType(4 , 'Word'),
    MailType(5 , 'Excel'),
  ];

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

            //name
            CustomFormField(
                hintText: S.of(context).addMailName,
                preIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10, top: 12),
                  child: Text(
                    S.of(context).mailName +'* ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),controller: _mailNameController),

            // mailNumber
            CustomFormField(
                hintText: S.of(context).addMailNumber,
                preIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10, top: 12),
                  child: Text(
                    S.of(context).mailNumber + '* ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),controller: _mailNumberController),

           CustomContainer( DropdownButton(

             // Initial Value
             value: screenState.dropdownvalue,
underline: Container(),

             // Down Arrow Icon
             icon: const Icon(Icons.keyboard_arrow_down),

             // Array list of items
             items: types.map((MailType items) {
               return DropdownMenuItem(
                 value: items,
                 child: Text(items.title),
               );
             }).toList(),
             // After selecting the desired option,it will
             // change button value to selected value
             onChanged: (MailType? newValue) {
               screenState.dropdownvalue = newValue!;
               screenState.refresh();
             },
             isExpanded: true,
             hint: Text('  ' + S.of(context).selectMailFormat +' * '),
           ),),

            //Date
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
                                      onPressed: () {

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
                    screenState.createMail(CreateMailRequest(
                      date: _dateTime!.toIso8601String(),
                      mailName: _mailNameController.text,
                      mailNumber: _mailNumberController.text,
                      attachment: [],
                      fileFormat:screenState.dropdownvalue?.id,
                    ),
                       _attachRequest
                    );
                  }
                },
                loading: false,
                text: S.of(context).addMail,
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