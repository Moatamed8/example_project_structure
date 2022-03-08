import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tamyez/screens/login/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset('assets/images/splash.png',fit: BoxFit.fill,)),
    );
  }
}