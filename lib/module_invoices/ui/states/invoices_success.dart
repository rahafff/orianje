import 'package:flutter/material.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_auth/ui/widget/login_widgets/custem_button.dart';
import 'package:oringe/module_invoices/model/invoice_model.dart';
import 'package:oringe/module_invoices/ui/screen/invoices_screen.dart';
import 'package:oringe/module_invoices/widget/invoice_card.dart';
import 'package:oringe/utils/components/costom_search.dart';
import 'package:oringe/utils/components/empty_screen.dart';
import 'package:oringe/utils/components/error_screen.dart';

class InvoicesSuccess extends States{
  final InvoiceScreenState  screenState;
  final List<InvoiceModel>?  invoices;
  final String? error;
  final bool empty;
  InvoicesSuccess(this.screenState,{this.invoices, this.error,  this.empty = false}) : super(screenState);


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
      return EmptyStateWidget(
          empty: S.current.notSeen,
          onRefresh: () {
//           screenState.getUsers();
          });
    }
   return  RefreshIndicator(
     onRefresh: () async {
       screenState.filterRequest.filterParameters = '';
         screenState.getInvoices();
     },
     child: SingleChildScrollView(
       child: Column(
         children:  getStores(context)
       ),
     ),
   );
  }
  List<Widget> getStores(BuildContext context) {
    List<Widget> widgets = [];
    if (invoices == null) {
      return widgets;
    }
    if (invoices!.isEmpty) return widgets;
    for (var element in invoices!) {
      if (element.supplierName?.contains(search ?? '')==false && element.invoiceNumber?.contains(search ?? '')==false  ) {
        continue;
      }
      widgets.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Invoice2Card(
          response: element,
        ),
      ));
    }
    if (invoices != null) {
      widgets.insert(
          0,
          Row(
            children: [
              Expanded(
                child: CustomDeliverySearch(
                  hintText: S.current.searchForInvoiceNumAndName,
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
                                          groupValue: screenState.groupValuePaid,
                                          onChanged: (v) {
                                            screenState.groupValuePaid = v as int;
                                            myState(() {});
                                          },
                                          title: Text(S.of(context).paid),
                                          activeColor:
                                          Theme.of(context).primaryColor,
                                        ),
                                        fit: FlexFit.loose),
                                    Flexible(
                                        child: RadioListTile(
                                          value: 2,
                                          groupValue: screenState.groupValuePaid,
                                          onChanged: (v) {
                                            screenState.groupValuePaid = v as int;
                                            myState(() {});
                                          },
                                          title: Text(S.of(context).notPaid),
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
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  S.of(context).invoiceType,
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
                                          value: 0,
                                          groupValue: screenState.groupValueSell,
                                          onChanged: (v) {
                                            screenState.groupValueSell = v as int;
                                            myState(() {});
                                          },
                                          title: Text(S.of(context).sell),
                                          activeColor:
                                          Theme.of(context).primaryColor,
                                        ),
                                        fit: FlexFit.loose),
                                    Flexible(
                                        child: RadioListTile(
                                          value: 1,
                                          groupValue: screenState.groupValueSell,
                                          onChanged: (v) {
                                            screenState.groupValueSell = v as int;
                                            myState(() {});
                                          },
                                          title: Text(S.of(context).buy),
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
                                     if(screenState.groupValueSell != -1){
                                       String ree=   screenState.groupValueSell  == 0  ? '0' :'1';
                                       screenState.filterRequest.filterParameters +="type="+ree+',';
                                     }
                                     if(screenState.groupValuePaid != -1){
                                    String ree=   screenState.groupValuePaid  == 1  ? true.toString() :false.toString();
                                       screenState.filterRequest.filterParameters +="isPaid="+ree+',';
                                     }
////                                     screenState.filterRequest.filterParameters='invoiceNumber=454544555';
                                      Navigator.pop(context);
                                     screenState.getInvoices();
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