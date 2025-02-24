import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/managers/color_manager.dart';

class TextStyleManager {
  static double adaptiveFontSize(double size) {
    double scaleFactor = ScreenUtil().screenWidth > 600 ? 0.6 : 1.0;
    return (size * scaleFactor).sp;
  }

  static TextStyle style20BoldSec = TextStyle(
    color: ColorManager.secondary,
    fontSize: adaptiveFontSize(20),
    fontWeight: FontWeight.w700,
  );
  static TextStyle style18BoldSec = TextStyle(
    color: ColorManager.secondary,
    fontSize: adaptiveFontSize(18),
    fontWeight: FontWeight.w700,
  );
  static TextStyle style16BoldWhite = TextStyle(
    color: Colors.white,
    fontSize: adaptiveFontSize(16),
    fontWeight: FontWeight.w700,
  );
  static TextStyle style12BoldSec = TextStyle(
    color: ColorManager.secondary,
    fontSize: adaptiveFontSize(12),
    fontWeight: FontWeight.w700,
  );
  static TextStyle style14BoldSec = TextStyle(
    color: ColorManager.primary,
    fontSize: adaptiveFontSize(14),
    fontWeight: FontWeight.w700,
  );
    static TextStyle style12BoldBlue = TextStyle(
    color: ColorManager.blue,
    fontSize: adaptiveFontSize(12),
    fontWeight: FontWeight.w700,
  );
    static TextStyle style12BoldPrimary = TextStyle(
    color: ColorManager.primary,
    fontSize: adaptiveFontSize(12),
    fontWeight: FontWeight.w700,
  );
    static TextStyle style12BoldWhite = TextStyle(
    color: Colors.white,
    fontSize: adaptiveFontSize(12),
    fontWeight: FontWeight.w700,
  );
}
