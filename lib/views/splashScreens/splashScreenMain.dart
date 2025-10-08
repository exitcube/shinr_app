import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shinr_app/views/splashScreens/splashScreen1.dart';

import '../../utils/constants/app.themes.dart';



class SplashScreenMain extends StatefulWidget {
  const SplashScreenMain({super.key});

  @override
  State<SplashScreenMain> createState() => _SplashScreenMainState();
}

class _SplashScreenMainState extends State<SplashScreenMain> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const SplashScreen1());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Container(
          decoration: const BoxDecoration(
            gradient: AppThemes.splashGradientBg,
          ),
          child: Center(
            child: Image.asset(
              "assets/images/shinr_logo.png",
              width: 120.w,
              height: 120.h,
            ),
          ),
        )
      ),
    );
  }
}
