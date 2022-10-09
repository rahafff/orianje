import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/global_nav_key.dart';
import 'package:oringe/module_auth/ui/widget/login_widgets/custem_button.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:oringe/module_invoices/invoice_routes.dart';
import 'package:oringe/module_invoices/response/invoice_reponse.dart';
import 'package:oringe/module_invoices/widget/clipper.dart';
import 'package:oringe/module_invoices/widget/invoice_card.dart';
import 'package:oringe/module_messages/message_routes.dart';
import 'package:oringe/navigator_menu/navigator_menu.dart';
import 'package:oringe/utils/components/costom_search.dart';
import 'package:oringe/utils/components/custom_container.dart';
import 'package:oringe/utils/images/images.dart';
import 'package:url_launcher/url_launcher.dart';

@injectable
class AdminInvoiceScreen extends StatefulWidget {
  AdminInvoiceScreen();

  @override
  State<AdminInvoiceScreen> createState() => AdminInvoiceScreenState();
}

class AdminInvoiceScreenState extends State<AdminInvoiceScreen> {
  int groupValuePaid = 1;
  int groupValueSell = 1;
  List<InvoiceResponse> cardddes = [

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: CustomDeliverySearch(hintText: 'search')),
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
                                    'Payment',
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
                                            groupValue: groupValuePaid,
                                            onChanged: (v) {
                                              groupValuePaid = v as int;
                                              myState(() {});
                                            },
                                            title: Text('Paid'),
                                            activeColor:
                                                Theme.of(context).primaryColor,
                                          ),
                                          fit: FlexFit.loose),
                                      Flexible(
                                          child: RadioListTile(
                                            value: 2,
                                            groupValue: groupValuePaid,
                                            onChanged: (v) {
                                              groupValuePaid = v as int;
                                              myState(() {});
                                            },
                                            title: Text('Not Paid'),
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
                                    'Invoice type',
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
                                            groupValue: groupValueSell,
                                            onChanged: (v) {
                                              groupValueSell = v as int;
                                              myState(() {});
                                            },
                                            title: Text('Buy'),
                                            activeColor:
                                                Theme.of(context).primaryColor,
                                          ),
                                          fit: FlexFit.loose),
                                      Flexible(
                                          child: RadioListTile(
                                            value: 2,
                                            groupValue: groupValueSell,
                                            onChanged: (v) {
                                              groupValueSell = v as int;
                                              myState(() {});
                                            },
                                            title: Text('Sell'),
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
                                    'Date range',
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
                                            'From: ',
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
                                            'To: ',
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
                                        Navigator.pop(context);
                                      },
                                      loading: false,
                                      text: 'Continue',
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
                      color: Colors.white,
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
                )
              ],
            ),
            CustomContainer(
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InvoiceCard(
                    onTap: () {
                      Navigator.pushNamed(context, InvoiceRoutes.INVOICE_DETAILES);
                    },
                    response: cardddes[index],
                  );
                },
                itemCount: cardddes.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
