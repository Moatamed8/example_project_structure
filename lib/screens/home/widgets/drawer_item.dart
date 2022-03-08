import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tamyez/screens/widgets/text.dart';
import 'package:tamyez/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawerItem extends StatelessWidget {
final String text ;
final String icon;

CustomDrawerItem({this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/icons/1 filled.svg",
              color: ColorsUtils.tamyez,
            ),
            SizedBox(
              width: 20.w,
            ),
            CustomText(
              text: "الصفحه الرئيسيه",
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: ColorsUtils.tamyez,
            )
          ],
        ),
        Divider(
          color: ColorsUtils.borderLightGreyColor,
        )
      ],
    );
  }
}
