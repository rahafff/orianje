import 'package:flutter/material.dart';
import 'package:oringe/module_invoices/model/invoice_details_model.dart';
import 'package:oringe/module_invoices/response/attach_response.dart';
import 'package:oringe/module_mails/model/mails_details_model.dart';
import 'package:oringe/utils/images/images.dart';

class AttachCard extends StatelessWidget {
  final AttachModel attachResponse;
  AttachCard({required this.attachResponse});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        ImageAsset.PDF_FILE ,
        height: 50,
        width: 30,
      ),
      title: Text(
        attachResponse.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
//      subtitle: Text(attachResponse.date ?? '',style: TextStyle(color: Colors.grey),),
      trailing: Icon(
        Icons.file_download,
        color: Colors.black,
      ),
    );
  }
}
class AttachMailCard extends StatelessWidget {
  final AttachMailModel attachResponse;
  AttachMailCard({required this.attachResponse});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        ImageAsset.PDF_FILE ,
        height: 50,
        width: 30,
      ),
      title: Text(
        attachResponse.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
//      subtitle: Text(attachResponse.date ?? '',style: TextStyle(color: Colors.grey),),
      trailing: Icon(
        Icons.file_download,
        color: Colors.black,
      ),
    );
  }
}
