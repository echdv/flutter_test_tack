/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */
import 'package:flutter_test_task/helpers/resources/app_colors.dart';

abstract class AppFonts {
  static TextStyle bold20white = TextStyle(
    fontSize: 20.sp,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold18black = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );

  static TextStyle normal15black45 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.black45Color,
  );
}
