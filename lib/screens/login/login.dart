import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamyez/utils/ColorsUtils.dart';

import 'component/login_screen.dart';
import 'component/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin  {
  TabController _controller;
  int _selectIndex=0;
@override
  void initState() {
  _controller = TabController(vsync: this, length: 2,initialIndex: 0);
  _controller.addListener(() {
    setState(() {
      _selectIndex = _controller.index;
    });
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.tamyez,
      body: ListView(
        padding: EdgeInsets.only(top: 32.h, right: 10.w, left: 10.w),
        children: [
          SizedBox(
            height: 22.h,
          ),
          Container(
              width: 150.w,
              height: 200.w,
              child: Image.asset("assets/images/logo_png.png")),
          SizedBox(
            height: 15.h,
          ),
          DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              padding: EdgeInsets.all(15),
              width: double.infinity,
              height: _selectIndex==0?460.h: 400.h,
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                color: ColorsUtils.whiteColorwithOpacity
              ) ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                      height: 47.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.transparent,
                          border: Border.all(
                              color: ColorsUtils.tamyez)),
                      child:  TabBar(
                        controller: _controller,
                          labelColor: Colors.white,
                          unselectedLabelColor: ColorsUtils.tamyez,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorsUtils.tamyez,
                          ),
                          tabs: [
                            nameTopicTabbarWidget('انشاء حساب'),
                            nameTopicTabbarWidget('تسجيل الدخول'),
                          ],
                        ),
                    ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Container(
                          width: 320.w,
                          color: Colors.transparent,
                          child: Center(child: showTabBarView())),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TabBarView showTabBarView() {
    return TabBarView(
      controller: _controller,
      physics: ScrollPhysics(),
      children: [RegisterationScreen(), SignIn()],
    );
  }

/////////////
  Tab nameTopicTabbarWidget(String titleTabBar) {
    return Tab(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: Colors.transparent, width: 0),
        ),
        child: Center(
          child: Text(
            titleTabBar,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}
