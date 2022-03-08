import 'package:flutter/material.dart';
import 'package:tamyez/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamyez/viewmodel/auth_provider.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          onTap: ()async{
            await AuthProvider.of(context).facebookLogin(context);
          },
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorsUtils.dodgerBlueColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              Icons.facebook,
              color: ColorsUtils.whiteColor,
            ),
          ),
        ),
        SizedBox(
          width: 50.w,
        ),
        InkWell(
          splashColor: Colors.transparent,
          onTap: ()async{
            await AuthProvider.of(context).googleLogin(context);
          },
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              Icons.facebook,
              color: ColorsUtils.whiteColor,
            ),
          ),
        )
      ],
    );
  }
}
