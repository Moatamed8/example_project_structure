import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamyez/screens/faq/freqs_screen.dart';
import 'package:tamyez/screens/home/widgets/drawer_item.dart';
import 'package:tamyez/screens/widgets/text.dart';
import 'package:tamyez/utils/ColorsUtils.dart';
import 'package:tamyez/utils/customFunctions.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150.h,
            padding: EdgeInsets.only(bottom: 25, right: 25),
            alignment: Alignment.bottomCenter,
            color: ColorsUtils.tamyez,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: ColorsUtils.borderLightGreyColor,
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: ColorsUtils.tamyez,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                CustomText(
                  text: "عبد الرحمن احمد",
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: ColorsUtils.borderLightGreyColor,
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 15,
                  padding: EdgeInsets.only(right: 15.w),
                  itemBuilder: (context, index) => InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        CustomFunctions.pushScreen(
                            widget: FrqsScreen(), context: context);
                      },
                      child: CustomDrawerItem())))
        ],
      ),
    );
  }
}
