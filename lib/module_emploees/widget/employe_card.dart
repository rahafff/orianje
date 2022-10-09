import 'package:flutter/material.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_emploees/model/employee_model.dart';
import 'package:oringe/module_invoices/widget/custom_text.dart';

import 'package:oringe/utils/images/images.dart';

class EmployeeCard extends StatelessWidget {
  final EmployeeModel response;
  final VoidCallback onTap;

  EmployeeCard({
    required this.response,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: (){
            onTap();
          },
          child: Stack(
            children: <Widget>[
              Container(
//                padding: EdgeInsets.only(left: 12,right: 12,top: 30),
                padding: EdgeInsets.all(10),
//                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 8,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(response.fullName ?? '',style: TextStyle(fontWeight: FontWeight.w600),),
                      SizedBox(height: 5,),
                      CustomText(title: S.of(context).phoneNumber, body: response.phone ?? '00000'),
//                      CustomText(title: S.of(context).e, body: response.phone ?? ''),



                    ],
                  ),
                ),
              ),
//              Positioned(
//                left: 5,
//                right: 5,
//                child: CircleAvatar(
//                  backgroundColor: Colors.transparent,
//                  radius: 35,
//                  backgroundImage: ExactAssetImage(ImageAsset.PROFILE,scale: 5),
////                  child: Image.asset(ImageAsset.PROFILE,),
//
//                ),
//              ),
            ],
          )
      ),
    );
  }
}
