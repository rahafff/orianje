import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_emploees/employee_routes.dart';
import 'package:oringe/module_emploees/model/record_model.dart';
import 'package:oringe/module_emploees/request/update_emp_request.dart';
import 'package:oringe/module_emploees/widget/edit_alert.dart';
import 'package:oringe/module_invoices/widget/custom_text.dart';
import 'package:oringe/utils/components/custom_container.dart';

class RecordCard extends StatelessWidget {
  final RecordModel response;
  final Function(UpdateRecordRequest) onTap;

  RecordCard({
    required this.response,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomContainer(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              response.month + response.year.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              CustomText(
                  title: S.of(context).day, body: response.days.toString()),

              CustomText(
                  title: S.of(context).hour, body: response.hours.toString()),
            ],),
            SizedBox(
              height: 10,
            ),

            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => EditRecordAlert(response,(request) {
                      onTap(request);
                    }),
                  );
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit , color: Colors.green,),
                    SizedBox(width: 10,),
                    Text(S.of(context).edit , style: TextStyle(color: Colors.green),),

                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),

              ),
            )
          ],
        ),
      )),
    );
  }
}
