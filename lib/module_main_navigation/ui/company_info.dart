import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/utils/components/custom_container.dart';
import 'package:oringe/utils/images/images.dart';

@injectable
class CompanyInfo extends StatefulWidget {
  @override
  _CompanyInfoState createState() => _CompanyInfoState();
}

class _CompanyInfoState extends State<CompanyInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          surfaceTintColor: Colors.grey.shade200,
          centerTitle: true,
          elevation: 5,
//          shape: ShapeBorder.,
          title: Text(S.of(context).companyInfo,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
        ),
        body:   Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ImageAsset.LOGO),
              SizedBox(height: 30,),
              Text(
                'Oranje dienstverlening B.V',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15,),
              Text(
                'Ammar Mahmasa',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15,),
              Text(
                '+31 68 7572341',
                style: TextStyle(fontSize: 20,),
              ),
            ],
          ),
        ),);
  }
}
