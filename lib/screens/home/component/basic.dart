import 'package:flutter/material.dart';
import 'package:tamyez/screens/widgets/text.dart';

class BasicScreen extends StatefulWidget {
  const BasicScreen({Key key}) : super(key: key);

  @override
  _BasicScreenState createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CustomText(text: "hsasodias",),),
    );
  }
}
