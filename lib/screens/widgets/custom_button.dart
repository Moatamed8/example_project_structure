import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:tamyez/screens/widgets/text.dart';
import 'package:tamyez/utils/ColorsUtils.dart';

// ignore: must_be_immutable
class CutomButton extends StatelessWidget {
  final String title;
  Function function;
  final double width;
  CutomButton({this.function, this.title, this.width});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 50.h,
        width: width ?? double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorsUtils.mainColor),
        child: Center(
          child: CustomText(
            text: '$title',
            color: ColorsUtils.whiteColor,
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
