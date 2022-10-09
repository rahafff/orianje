import 'package:flutter/material.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_auth/ui/widget/login_widgets/custem_button.dart';
import 'package:oringe/module_emploees/request/create_employee_request.dart';
import 'package:oringe/module_emploees/ui/screen/add_employe.dart';
import 'package:oringe/utils/components/custom_feild.dart';

class AddEmployeeInit extends States{
  final AddEmployeeScreenState _screenState;

  AddEmployeeInit(this._screenState ,) : super(_screenState) {
   _yearConttroller.text = DateTime.now().year.toString();
   _monthConttroller.text = DateTime.now().month.toString();
  }

  var _hourConttroller = TextEditingController();
  var _dayConttroller = TextEditingController();

  var _yearConttroller = TextEditingController();
  var _monthConttroller = TextEditingController();
  final GlobalKey<FormState> _addInvoiceKey = GlobalKey<FormState>();

  @override
  Widget getUI(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _addInvoiceKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
//          CustomContainer(
//            DropdownSearch<String>(
//              popupProps: PopupProps.modalBottomSheet(
//                showSelectedItems: true,
//                disabledItemFn: (String s) => s.startsWith('I'),
//                searchFieldProps: TextFieldProps(
//                    decoration: InputDecoration(
//                        labelText: "Search emplyee",
//                        hintText: "Search emplyee",
//                        filled: true,
//                        border: OutlineInputBorder(
//                          borderRadius: BorderRadius.circular(10.0),
//                          borderSide: BorderSide(color: Colors.black),
//                        ),
//                        labelStyle: TextStyle(color: Colors.black))),
//                showSearchBox: true,
//              ),
//              items: [
//                "Ahmad ali",
//                "Rahaf tann",
//                "Toni ali",
//                'fozy fathey',
//                'yasser muhamad'
//              ],
//              onChanged: print,
//              enabled: true,
//              selectedItem: 'Select the employee *',
//            ),
//          ),
            CustomFormField(
                preIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10, top: 12),
                  child: Text(
                    S.of(context).workHour + '* ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                hintText: S.of(context).addWorkHour,
                numbers: true,
                validator: true,
                sufIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 12),
                  child: Text(S.of(context).hour ,style: TextStyle(fontWeight: FontWeight.bold),),
                ) ,controller: _hourConttroller),

            CustomFormField(
              hintText:S.of(context).workDay,
              preIcon: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10, top: 12),
                child: Text(
                  S.of(context).addWorkDay + ' * ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              sufIcon: Padding(
                padding: const EdgeInsetsDirectional.only(top: 12),
                child: Text( S.of(context).day,style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              numbers: true,
              controller: _dayConttroller,
              validator: true,

            ),


            CustomFormField(
                preIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10, top: 12),
                  child: Text(
                    S.of(context).month +'* ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                hintText:  S.of(context).month,
                numbers: true,
                validator: true,
                controller: _monthConttroller),

            CustomFormField(
              hintText: S.of(context).year +'* ',
              preIcon: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10, top: 12),
                child: Text(
                  S.of(context).year +'* ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              numbers: true,
              controller: _yearConttroller,
              validator: true,
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                buttonTab: () {
                  if (_addInvoiceKey.currentState!.validate()) {

                    _screenState.createRecord(CreateRecordRequest(
                        month: int.parse(_monthConttroller.text) -1,
                      empId: _screenState.id,
                      days: int.parse(_dayConttroller.text),hours: int.parse(_hourConttroller.text),
                      year: int.parse(_yearConttroller.text)
                    ),

                    );
                  }
                },
                loading: false,
                text: S.of(context).addRecord,
                bgColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
            ),

          ],
        ),
      ),
    );
  }
}