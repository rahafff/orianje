import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String title;
  String body;

  CustomText({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title + ': ',

        ),
        Text(
          body,
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
