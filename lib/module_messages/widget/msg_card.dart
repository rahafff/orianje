import 'package:flutter/material.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_invoices/widget/custom_text.dart';
import 'package:oringe/module_messages/message_routes.dart';
import 'package:oringe/module_messages/model/msg_model.dart';

class MsgCard extends StatelessWidget {
  final MsgModel model;


  MsgCard(this.model);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, MessageRoutes.DETAILS_SCREEN , arguments: model);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                ListTile(title: Text(model.title),subtitle:  Text(model.text),
                  trailing: Text(model.date),),
//            CustomText(title: S.of(context).senderName, body: model.senderName)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
