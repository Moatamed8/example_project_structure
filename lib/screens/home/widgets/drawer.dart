import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamyez/screens/widgets/text.dart';
import 'package:tamyez/utils/ColorsUtils.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200.h,
            color: ColorsUtils.tamyez,
          ),
          Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) => CustomText(text: "siuhusa",)))
        ],
      ),
    );
  }
}
