import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_invoices/invoice_routes.dart';
import 'package:oringe/module_invoices/model/invoice_model.dart';
import 'package:oringe/module_invoices/response/invoice_reponse.dart';
import 'package:oringe/module_invoices/widget/custom_text.dart';
import 'package:oringe/utils/components/custom_container.dart';
import 'package:oringe/utils/images/images.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

class InvoiceCard extends StatelessWidget {
  final InvoiceResponse response;
  final VoidCallback onTap;

  InvoiceCard({
    required this.response,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 10, end: 10, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: Column(
                      children: [
                        CustomText(
                          title: 'Supplier name',
                          body: 'Dell',
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(title: 'Invoice number', body: '4533sss11')
                      ],
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: response.type == 0
                                ? Icon(
                                    Icons.arrow_upward,
                                  )
                                : Icon(
                                    Icons.arrow_downward,
                                  ),
                            decoration: new BoxDecoration(
                                color: Colors.grey.shade300,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(5)),
                            margin: EdgeInsetsDirectional.all(3),
                            padding: EdgeInsetsDirectional.all(1),
                          ),
                          Image.asset(
                            response.isPaid!
                                ? ImageAsset.NOT_PAIED
                                : ImageAsset.PAIED,
                            width: 25,
                            height: 25,
                          ),
                        ],
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(title: 'CashBook number', body: 'sd383'),
                  Text('05/02/2022')
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10),
                child: Divider(
                  height: 2,
                  thickness: 2,
                ),
              )
            ],
          ),
        ));
  }
}

class Invoice2Card extends StatelessWidget {
  final InvoiceModel response;


  Invoice2Card({
    required this.response,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, InvoiceRoutes.INVOICE_DETAILES,arguments: response.id);
        },
        child: Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  stops: [0.02, 0.02],
                  colors: response.isPayed!
                      ? [Colors.green, Colors.white]
                      : [Colors.red, Colors.white]),
              borderRadius: BorderRadius.all(const Radius.circular(6.0)),
              color: Colors.white,      boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 8,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],),
          foregroundDecoration:   RotatedCornerDecoration(
            color:response.type == 0 ? Colors.blue.shade200 : Colors.blue.shade700,
            geometry: const BadgeGeometry(width: 70, height: 40, cornerRadius: 6),
           textSpan: response.type == 0
               ? TextSpan(
            text: S.of(context).sell,)
               : TextSpan(text: S.of(context).buy

           ),
          ),
          child: Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 12, end: 12, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: S.of(context).supplierName,
                  body: response.supplierName ?? '',
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(title: S.of(context).cashBookNumber, body: response.cashBookNumber ?? ''),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(title: S.of(context).invoiceNumber, body: response.invoiceNumber ?? ''),
                    Text(response.date?.split('T').first ?? '')
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
