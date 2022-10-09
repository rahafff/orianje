import 'package:flutter/material.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_auth/ui/widget/login_widgets/custem_button.dart';
import 'package:oringe/module_emploees/model/employee_model.dart';
import 'package:oringe/module_emploees/model/record_model.dart';
import 'package:oringe/module_emploees/ui/screen/emp_record_screen.dart';
import 'package:oringe/module_emploees/ui/screen/employees_screen.dart';
import 'package:oringe/module_emploees/widget/employe_card.dart';
import 'package:oringe/module_emploees/widget/record_card.dart';
import 'package:oringe/utils/components/costom_search.dart';
import 'package:oringe/utils/components/empty_screen.dart';
import 'package:oringe/utils/components/error_screen.dart';

class RecordListSuccess extends States {
  final EmployeeRecordScreenState _screenState;
  final List<RecordModel>?  records;
  final String? error;
  final bool empty;

  RecordListSuccess( this._screenState ,{required this.records ,this.error,  this.empty = false}): super(_screenState);

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
   return RefreshIndicator(
     onRefresh: () async{
       _screenState.getRecord();
     },
     child: SingleChildScrollView(
       child: Column(
         children: [
           GridView.builder(
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               mainAxisExtent: 180,
             ),
             itemBuilder: (context, index) {
               return RecordCard(onTap: (req){
                 _screenState.updateRecord(req);
               },response: records![index],);
             },
             physics: NeverScrollableScrollPhysics(),
             shrinkWrap: true,
             itemCount: records!.length,
           ),
         ],
       ),
     ),
   );
  }
}