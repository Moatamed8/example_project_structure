import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamyez/screens/home/widgets/drawer.dart';
import 'package:tamyez/screens/widgets/text.dart';
import 'package:tamyez/utils/ColorsUtils.dart';

import 'component/basic.dart';

class HomeBottomNavegationBar extends StatefulWidget {
  @override
  _HomeBottomNavegationBarState createState() =>
      _HomeBottomNavegationBarState();
}

class _HomeBottomNavegationBarState extends State<HomeBottomNavegationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final screens = [
    BasicScreen(),
    BasicScreen(),
    BasicScreen(),
    BasicScreen(),
  ];

  Future<bool> _onWillpop() async {
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0;
      });
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillpop,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorsUtils.tamyez,
            actions: [
              Icon(Icons.search),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.notification_important),
              SizedBox(
                width: 10,
              ),
            ],
            title: CustomText(
              text: "حفاظ المتون",
              fontSize: 20,
              color: ColorsUtils.whiteColor,
            ),
            leading: Builder(
              builder: (ctx) => IconButton(
                icon: Icon(Icons.accessible),
                onPressed: () => Scaffold.of(ctx).openDrawer(),
              ),
            ),
          ),
          body: IndexedStack(index: _selectedIndex, children: screens),
          bottomNavigationBar: SizedBox(
            height: 87.h,
            child: BottomNavigationBar(
              backgroundColor: ColorsUtils.whiteColor,
              enableFeedback: false,
              selectedFontSize: 11.sp,
              unselectedFontSize: 11.sp,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  activeIcon: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/1 filled.svg',
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                  icon: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/1 filled.svg',
                        color: ColorsUtils.greyColor,
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                  label: 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  activeIcon: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/2 filled.svg',
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                  icon: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/2 filled.svg',
                        color: ColorsUtils.greyColor,
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                  label: 'الورد اليومي',
                ),
                BottomNavigationBarItem(
                  activeIcon: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/3 filled.svg',
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                  icon: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/3 filled.svg',
                        color: ColorsUtils.greyColor,
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                  label: 'قائمه المتون',
                ),
                BottomNavigationBarItem(
                  activeIcon: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/4 filled.svg',
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                  icon: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/4 filled.svg',
                        color: ColorsUtils.greyColor,
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                  label: 'المحفوظات',
                ),
              ],
              elevation: 0.0,
              currentIndex: _selectedIndex,
              selectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 11.sp),
              unselectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 11.sp),
              selectedIconTheme: IconThemeData(color: ColorsUtils.tamyez),
              unselectedItemColor: ColorsUtils.greyColor,
              selectedItemColor: ColorsUtils.tamyez,
              onTap: _onItemTapped,
            ),
          ),
          drawer:  CustomDrawer(),
        ),
      ),
    );
  }
}
