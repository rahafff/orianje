import 'package:flutter/material.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_auth/ui/widget/login_widgets/custem_button.dart';
import 'package:oringe/module_emploees/employee_routes.dart';
import 'package:oringe/module_emploees/model/employee_model.dart';
import 'package:oringe/module_emploees/ui/screen/employees_screen.dart';
import 'package:oringe/module_emploees/widget/employe_card.dart';
import 'package:oringe/utils/components/costom_search.dart';
import 'package:oringe/utils/components/empty_screen.dart';
import 'package:oringe/utils/components/error_screen.dart';

class EmployeesListSuccess extends States {
  final EmployeesScreenState _screenState;
  final List<EmployeeModel>?  employees;
  final String? error;
  final bool empty;

  EmployeesListSuccess( this._screenState ,{required this.employees ,this.error,  this.empty = false}): super(_screenState);

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
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Expanded(child: CustomDeliverySearch(hintText: 'search')),
//             InkWell(
//               onTap: () {
//                 showModalBottomSheet(
//                     builder: (context) {
//                       return StatefulBuilder(
//                         builder: (context, myState) => Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Date range',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Text(
//                                         'From: ',
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//                                           showDatePicker(
//                                               context: context,
//                                               initialDate: DateTime.now(),
//                                               firstDate: DateTime.now(),
//                                               lastDate:
//                                               DateTime(2025, 1, 1));
//                                         },
//                                         child: Container(
//                                           decoration: new BoxDecoration(
//                                             color: Theme.of(context)
//                                                 .dividerColor,
//                                             borderRadius:
//                                             BorderRadius.circular(8),
//                                           ),
//                                           child: Padding(
//                                             padding:
//                                             const EdgeInsets.all(10.0),
//                                             child: Text('00:00:0000'),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         'To: ',
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//                                           showDatePicker(
//                                               context: context,
//                                               initialDate: DateTime.now(),
//                                               firstDate: DateTime.now(),
//                                               lastDate:
//                                               DateTime(2025, 1, 1));
//                                         },
//                                         child: Container(
//                                           decoration: new BoxDecoration(
//                                             color: Theme.of(context)
//                                                 .dividerColor,
//                                             borderRadius:
//                                             BorderRadius.circular(8),
//                                           ),
//                                           child: Padding(
//                                             padding:
//                                             const EdgeInsets.all(10.0),
//                                             child: Text('00:00:0000'),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               Spacer(),
//                               Padding(
//                                 padding: const EdgeInsets.all(12.0),
//                                 child: CustomButton(
//                                   buttonTab: () {
//                                     Navigator.pop(context);
//                                   },
//                                   loading: false,
//                                   text: 'Continue',
//                                   bgColor: Theme.of(context).primaryColor,
//                                   textColor: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     backgroundColor: Colors.white,
//                     context: context);
//               },
//               child: Container(
//                 margin:
//                 EdgeInsetsDirectional.only(top: 8, end: 8, start: 0),
//                 decoration: new BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
////                      spreadRadius: 8,
//                       blurRadius: 8,
//                       offset: Offset(0, 3), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Icon(
//                     Icons.filter_list,
//                     size: 30,
//                   ),
//                 ),
//               ),
//             )
           ],
         ),
         GridView.builder(
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
//             mainAxisExtent: 220,
           ),
           itemBuilder: (context, index) {
             return EmployeeCard(onTap: (){
               Navigator.pushNamed(context,  EmployeeRoutes.VIEW_RECORD ,arguments: employees![index].id);
             },response: employees![index],);
           },
           physics: NeverScrollableScrollPhysics(),
           shrinkWrap: true,
           itemCount: employees!.length,
         ),
       ],
     ),
   );
  }
}