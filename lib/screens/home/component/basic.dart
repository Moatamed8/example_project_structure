import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamyez/screens/widgets/text.dart';
import 'package:tamyez/utils/ColorsUtils.dart';

class BasicScreen extends StatefulWidget {
  const BasicScreen({Key key}) : super(key: key);

  @override
  _BasicScreenState createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.all(0),
      children: [
        Container(
          height: 150.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: ColorsUtils.tamyez,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "الاحتفاظ مافي صدرك افضل من كتابك ",
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: ColorsUtils.orange,
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: "الخليل",
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: ColorsUtils.orange,
              ),
            ],
          ),
        ),
        SizedBox(height: 25,),
      ],
    ));
  }
}
