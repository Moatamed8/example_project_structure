import 'package:flutter/material.dart';
import 'package:tamyez/screens/widgets/text.dart';
import 'package:tamyez/utils/ColorsUtils.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          Expanded(
              child: Divider()
          ),

          CustomText(text: "او سجل عبر الدخول",color: ColorsUtils.tamyez,fontSize: 15,),

          Expanded(
              child: Divider()
          ),
        ]
    );
  }
}
