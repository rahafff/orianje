import 'package:flutter/material.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:oringe/consts/country_code.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_auth/ui/widget/login_widgets/custem_button.dart';
import 'package:oringe/module_mails/model/mails_model.dart';
import 'package:oringe/module_mails/ui/screen/mails_list_screen.dart';
import 'package:oringe/module_mails/widget/mail_card.dart';
import 'package:oringe/utils/components/costom_search.dart';
import 'package:oringe/utils/components/empty_screen.dart';
import 'package:oringe/utils/components/error_screen.dart';

class MailsStateSuccess extends States {
  final MailsScreenState screenState;
  final List<MailsModel>? mails;
  final String? error;
  final bool empty;
  MailsStateSuccess(this.screenState,
      {this.mails, this.error, this.empty = false})
      : super(screenState);

  String? search;
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
      print('emmpptyy');
      return EmptyStateWidget(
          empty: S.current.notSeen,
          onRefresh: () {
//           screenState.getUsers();
          });
    }
    return RefreshIndicator(
        onRefresh: () async {
          screenState.filterRequest.filterParameters = '';
          screenState.getMails();
        },

        child: SingleChildScrollView(
          child: Column(children: getStores(context)),
        ));

//       SingleChildScrollView(
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(child: CustomDeliverySearch(hintText: S.of(context).search)),
//               InkWell(
//                 onTap: () {
//                   showModalBottomSheet(
//                       builder: (context) {
//                         return StatefulBuilder(
//                           builder: (context, myState) => Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                   S.of(context).seen,
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Flexible(
//                                         child: RadioListTile(
//                                           value: 1,
//                                           groupValue: groupValuePaid,
//                                           onChanged: (v) {
//                                             groupValuePaid = v as int;
//                                             myState(() {});
//                                           },
//                                           title: Text(S.of(context).seen),
//                                           activeColor:
//                                           Theme.of(context).primaryColor,
//                                         ),
//                                         fit: FlexFit.loose),
//                                     Flexible(
//                                         child: RadioListTile(
//                                           value: 2,
//                                           groupValue: groupValuePaid,
//                                           onChanged: (v) {
//                                             groupValuePaid = v as int;
//                                             myState(() {});
//                                           },
//                                           title: Text(S.of(context).notSeen),
//                                           activeColor:
//                                           Theme.of(context).primaryColor,
//                                         ),
//                                         fit: FlexFit.loose),
//                                   ],
//                                 ),
//                                 Divider(
//                                   height: 2,
//                                   thickness: 2,
//                                   endIndent: 50,
//                                   indent: 50,
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//
//                                 Text(
//                                  S.of(context).dateRange,
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18),
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Text(
//                                           S.of(context).from,
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.w600),
//                                         ),
//                                         InkWell(
//                                           onTap: () {
//                                             showDatePicker(
//                                                 context: context,
//                                                 initialDate: DateTime.now(),
//                                                 firstDate: DateTime.now(),
//                                                 lastDate:
//                                                 DateTime(2025, 1, 1));
//                                           },
//                                           child: Container(
//                                             decoration: new BoxDecoration(
//                                               color: Theme.of(context)
//                                                   .dividerColor,
//                                               borderRadius:
//                                               BorderRadius.circular(8),
//                                             ),
//                                             child: Padding(
//                                               padding:
//                                               const EdgeInsets.all(10.0),
//                                               child: Text('00:00:0000'),
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           S.of(context).to,
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.w600),
//                                         ),
//                                         InkWell(
//                                           onTap: () {
//                                             showDatePicker(
//                                                 context: context,
//                                                 initialDate: DateTime.now(),
//                                                 firstDate: DateTime.now(),
//                                                 lastDate:
//                                                 DateTime(2025, 1, 1));
//                                           },
//                                           child: Container(
//                                             decoration: new BoxDecoration(
//                                               color: Theme.of(context)
//                                                   .dividerColor,
//                                               borderRadius:
//                                               BorderRadius.circular(8),
//                                             ),
//                                             child: Padding(
//                                               padding:
//                                               const EdgeInsets.all(10.0),
//                                               child: Text('00:00:0000'),
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                                 Spacer(),
//                                 Padding(
//                                   padding: const EdgeInsets.all(12.0),
//                                   child: CustomButton(
//                                     buttonTab: () {
//                                       Navigator.pop(context);
//                                     },
//                                     loading: false,
//                                     text: S.of(context).applyFilter,
//                                     bgColor: Theme.of(context).primaryColor,
//                                     textColor: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       backgroundColor: Colors.white,
//                       context: context);
//                 },
//                 child: Container(
//                   margin:
//                   EdgeInsetsDirectional.only(top: 8, end: 8, start: 0),
//                   decoration: new BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
////                      spreadRadius: 8,
//                         blurRadius: 8,
//                         offset: Offset(0, 3), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Icon(
//                       Icons.filter_list,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           ListView.builder(
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: MailCard(
//                   response: mails![index],
//                 ),
//               );
//             },
//             itemCount: mails!.length,
//           ),
//         ],
//       ),
//     ) ;
  }

  List<Widget> getStores(BuildContext context) {
    List<Widget> widgets = [];
    if (mails == null) {
      return widgets;
    }
    if (mails!.isEmpty) return widgets;
    for (var element in mails!) {
      if (element.mailNumber.contains(search ?? '') == false  && element.mailName.contains(search ?? '')==false ) {
        continue;
      }
      widgets.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: MailCard(
          response: element,
        ),
      ));
    }
    if (mails != null) {
      widgets.insert(
          0,
          Row(
            children: [
              Expanded(
                child: CustomDeliverySearch(
                  hintText: S.current.searchMailNameOrNumber,
                  onChanged: (s) {
                    if (s == '' || s.isEmpty) {
                      search = null;
                      screenState.refresh();
                    } else {
                      search = s;
                      screenState.refresh();
                    }
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, myState) => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  S.of(context).payment ,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                        child: RadioListTile(
                                          value: 1,
                                          groupValue: screenState.groupValueSeen,
                                          onChanged: (v) {
                                            screenState.groupValueSeen = v as int;
                                            myState(() {});
                                          },
                                          title: Text(S.of(context).seen),
                                          activeColor:
                                          Theme.of(context).primaryColor,
                                        ),
                                        fit: FlexFit.loose),
                                    Flexible(
                                        child: RadioListTile(
                                          value: 2,
                                          groupValue: screenState.groupValueSeen,
                                          onChanged: (v) {
                                            screenState.groupValueSeen = v as int;
                                            myState(() {});
                                          },
                                          title: Text(S.of(context).notSeen),
                                          activeColor:
                                          Theme.of(context).primaryColor,
                                        ),
                                        fit: FlexFit.loose),
                                  ],
                                ),
                                Divider(
                                  height: 2,
                                  thickness: 2,
                                  endIndent: 50,
                                  indent: 50,
                                ),


                                Text(
                                  S.of(context).dateRange,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          S.of(context).from,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            showDatePicker(context: context,initialDate: DateTime.now(),firstDate: DateTime.now(),lastDate: DateTime(2025, 1, 1) );
                                          },
                                          child: Container(
                                            decoration: new BoxDecoration(
                                              color:
                                              Theme.of(context).dividerColor,
                                              borderRadius:
                                              BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text('00:00:0000'),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          S.of(context).to,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            showDatePicker(context: context,initialDate: DateTime.now(),firstDate: DateTime.now(),lastDate: DateTime(2025, 1, 1) );
                                          },
                                          child: Container(
                                            decoration: new BoxDecoration(
                                              color:
                                              Theme.of(context).dividerColor,
                                              borderRadius:
                                              BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text('00:00:0000'),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: CustomButton(
                                    buttonTab: () {
                                      screenState.filterRequest.filterParameters = '';
                                      if(screenState.groupValueSeen != -1){
                                        String ree=   screenState.groupValueSeen  == 1  ? true.toString() :false.toString();
                                        screenState.filterRequest.filterParameters +="isSeen="+ree+',';
                                      }
                                      Navigator.pop(context);
                                      screenState.getMails();
                                    },
                                    loading: false,
                                    text: S.of(context).applyFilter,
                                    bgColor: Theme.of(context).primaryColor,
                                    textColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Colors.white,
                      context: context);
                },
                child: Container(
                  margin: EdgeInsetsDirectional.only(top: 8, end: 8, start: 0),
                  decoration: new BoxDecoration(
                    color:screenState.filterRequest.filterParameters.isNotEmpty ? Theme.of(context).primaryColorDark : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
//                      spreadRadius: 8,
                        blurRadius: 8,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.filter_list,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ));
    }
    return widgets;
  }
}
