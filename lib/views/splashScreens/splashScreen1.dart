import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/constants/Strings.dart';
import '../../utils/constants/app.themes.dart';
import '../auth/loginScreen.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  int _currentTab = 0;
  final int _totalTabs = 3;
  final List<String> images = [
    "assets/images/car_illustration.png",
    "assets/images/calendar_illustration.png",
    "assets/images/spanner_illustrations.png",
  ];
  final List<String> welcomHeadings=[Strings.welcomeHeading1,Strings.welcomeHeading2,Strings.welcomeHeading3];
  final List<String> welcomNotes=[Strings.welcomeNote1,Strings.welcomeNote2,Strings.welcomeNote3];

  void _nextTab() {
    setState(() {
      _currentTab = (_currentTab + 1) % _totalTabs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 16.h),
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: AppThemes.splashGradientBg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/shinr_logo.png",
                width: 350.w,
                height: 32.h,
              ),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  // Background illustration
                  Image.asset(
                    "assets/images/illustration_background.png",
                    width: 458.w,
                    height: 273.h,
                  ),
                  // Car illustration
                  Positioned(
                    bottom: -90.h,
                    child: Image.asset(
                      images[_currentTab],
                      width: _currentTab == 2 ? MediaQuery.of(context).size.width : 330.w,
                      height: 280.h,
                      fit: _currentTab == 2 ? BoxFit.cover : null,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 84.h,
              ),
              Text(
                welcomHeadings[_currentTab],
                style: TextStyle(
                    color: AppThemes.neutralBlack,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                welcomNotes[_currentTab],
                style: TextStyle(
                  color: AppThemes.neutralBlack,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              Container(
                width: 80.w,
                height: 32.h,
                child: Stack(
                  children: [
                    // Background line (inactive)
                    Container(
                      width: 80.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: AppThemes.primaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
      
                    // Active indicator
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 300),
                      left: (_currentTab * 26.66.w),
                      child: Container(
                        width: 26.66.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: AppThemes.primaryColor,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      
              // Conditional button based on current tab
              // Conditional button based on current tab
              _currentTab == 2
                  ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => LoginScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.w),
                    width: double.infinity,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppThemes.primaryColor,
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.getStarted,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              )
                  : GestureDetector(
                onTap: _nextTab,
                child: Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: AppThemes.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}