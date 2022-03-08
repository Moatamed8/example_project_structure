import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tamyez/screens/home/home.dart';
import 'package:tamyez/screens/login/login.dart';
import 'package:tamyez/utils/TokenUtil.dart';
import 'package:tamyez/utils/customFunctions.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      if (TokenUtil.getTokenFromMemory().isNotEmpty) {
        CustomFunctions.pushScreen(widget: LoginScreen(), context: context);
      } else {
        CustomFunctions.pushScreen(
            widget: HomeBottomNavegationBar(), context: context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/images/splash.png',
            fit: BoxFit.fill,
          )),
    );
  }
}
