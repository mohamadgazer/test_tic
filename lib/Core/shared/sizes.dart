import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PH {
  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double statusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double bottomBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static double safeAreaHeight(BuildContext context) {
    return PH.height(context) -
        PH.statusBarHeight(context) -
        PH.bottomBarHeight(context);
  }

  static double safeAreaWidth(BuildContext context) {
    return PH.width(context);
  }

  static double appBarHeight(BuildContext context) {
    return PH.height(context) - PH.safeAreaHeight(context); // 56.0
  }

  static double s10 = 10.0;
  static double s15 = 15.0;
  static double s20 = 20.0;

  static double screentitle = 40.0.sp;
}
