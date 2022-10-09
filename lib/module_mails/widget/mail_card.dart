import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_invoices/widget/custom_text.dart';
import 'package:oringe/module_mails/mail_routes.dart';
import 'package:oringe/module_mails/model/mails_model.dart';

class MailCard extends StatelessWidget {
  final MailsModel response;
  MailCard({
    required this.response,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, MailRoutes.MAIL_DETAILES,
              arguments: response.id);
        },
        child: Container(
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(const Radius.circular(8.0)),
            color: Colors.white,      boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 8,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      response.mailName,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    response.isSeen
                        ? Icon(
                            FontAwesomeIcons.checkDouble,
                            color: Colors.green,
                          )
                        : Text(
                      S.of(context).notSeen,style: TextStyle(color: Colors.red.shade700),

                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                CustomText(title: S.of(context).format, body: response.fileFormat),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(title: S.of(context).mailNumber, body: response.mailNumber),
                    Text(response.date.split('T').first)
                  ],
                ),

              ],
            ),
          ),
        ));
  }
}
