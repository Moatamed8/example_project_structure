import 'package:flutter/material.dart';
import 'package:tamyez/utils/ColorsUtils.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color color;
  TextAlign textAlign;

  CustomText(
      {this.text,
      this.fontSize = 12,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.w500,
      this.color = ColorsUtils.blackColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(

          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight),
      overflow: TextOverflow.ellipsis,
    );
  }
}
