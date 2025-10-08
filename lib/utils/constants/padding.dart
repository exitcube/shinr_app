import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPaddings {
  // All sides
  static EdgeInsets paddingAll16 = EdgeInsets.all(16.r);

  // Individual sides
  static EdgeInsets paddingTop16 = EdgeInsets.only(top: 16.h);
  static EdgeInsets paddingTop64 = EdgeInsets.only(top: 64.h);
  static EdgeInsets paddingLeft16 = EdgeInsets.only(left: 16.w);
  static EdgeInsets paddingRight16 = EdgeInsets.only(right: 16.w);
  static EdgeInsets paddingBottom16 = EdgeInsets.only(bottom: 16.h);

  // Horizontal & Vertical
  static EdgeInsets paddingHorizontal16 = EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets paddingVertical16 = EdgeInsets.symmetric(vertical: 16.h);
}
