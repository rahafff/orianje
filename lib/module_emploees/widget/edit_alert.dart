import 'package:flutter/material.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_auth/ui/widget/login_widgets/custem_button.dart';
import 'package:oringe/module_emploees/model/record_model.dart';
import 'package:oringe/module_emploees/request/update_emp_request.dart';
import 'package:oringe/utils/components/custom_feild.dart';

class EditRecordAlert extends StatelessWidget {
  final RecordModel _model;
  final Function(UpdateRecordRequest) onEditPress;

  EditRecordAlert(this._model , this.onEditPress) : super() {
    _hourConttroller.text = _model.hours.toString();
    _dayConttroller.text = _model.days.toString();
    _yearConttroller.text = _model.year.toString();
    _monthConttroller.text = _model.month.toString().split('-').first;

  }

  var _hourConttroller = TextEditingController();
  var _dayConttroller = TextEditingController();

  var _yearConttroller = TextEditingController();
  var _monthConttroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).edit),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
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
                  child: Text(
                    S.of(context).hour,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                controller: _hourConttroller),
            CustomFormField(
              hintText: S.of(context).workDay,
              preIcon: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10, top: 12),
                child: Text(
                  S.of(context).addWorkDay + ' * ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              sufIcon: Padding(
                padding: const EdgeInsetsDirectional.only(top: 12),
                child: Text(
                  S.of(context).day,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              numbers: true,
              controller: _dayConttroller,
              validator: true,
            ),
            CustomFormField(
                preIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10, top: 12),
                  child: Text(
                    S.of(context).month + '* ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                hintText: S.of(context).month,
                numbers: true,
                validator: true,
                controller: _monthConttroller),
            CustomFormField(
              hintText: S.of(context).year + '* ',
              preIcon: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10, top: 12),
                child: Text(
                  S.of(context).year + '* ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              numbers: true,
              controller: _yearConttroller,
              validator: true,
            ),
          ],
        ),
      ),
      actions: [TextButton(onPressed: () {
        Navigator.pop(context);
        onEditPress(UpdateRecordRequest(
            month: int.parse(_monthConttroller.text) -1,
            days: int.parse(_dayConttroller.text),
            hours: int.parse(_hourConttroller.text),
            year: int.parse(_yearConttroller.text),
          id: _model.id,

        ));
      }, child: Text(S.of(context).edit))],
    );
  }
}
