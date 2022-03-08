import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamyez/screens/login/widgets/divider.dart';
import 'package:tamyez/screens/login/widgets/social_buttons.dart';
import 'package:tamyez/screens/widgets/custom_button.dart';
import 'package:tamyez/screens/widgets/text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          CustomTextField(
            hintText: "البريد الالكتروني",
          ),
          SizedBox(height: 15.h,),
          CustomTextField(
            hintText: "كلمه المرور",
            isObscure: true,
            hasSufficIcon: true,

          ),
          SizedBox(height: 15.h,),
          CutomButton(
            width: double.infinity,
            title: "تسجيل الدخول",
          ),
          SizedBox(height: 15.h,),

          CustomDivider(),
          SizedBox(height: 15.h,),
          SocialButtons()

        ],
      ),
    );
  }
}
