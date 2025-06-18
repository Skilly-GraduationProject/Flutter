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
  static TextStyle style18BoldPrimary = TextStyle(
    color: ColorManager.primary,
    fontSize: adaptiveFontSize(18),
    fontWeight: FontWeight.w700,
  );
  static TextStyle style16BoldWhite = TextStyle(
    color: Colors.white,
    fontSize: adaptiveFontSize(16),
    fontWeight: FontWeight.w700,
  );
  static TextStyle style16BoldPrimary = TextStyle(
    color: ColorManager.primary,
    fontSize: adaptiveFontSize(16),
    fontWeight: FontWeight.w700,
  );
  static TextStyle style16RegSec = TextStyle(
    color: ColorManager.secondary,
    fontSize: adaptiveFontSize(16),
    fontWeight: FontWeight.w400,
  );
  static TextStyle style28BoldAmber = TextStyle(
    color: Colors.amber,
    fontSize: adaptiveFontSize(24),
    fontWeight: FontWeight.w700,
  );
  static TextStyle style12RegSec = TextStyle(
    color: ColorManager.secondary,
    fontSize: adaptiveFontSize(12),
    fontWeight: FontWeight.w400,
  );
  static TextStyle style12BoldSec = TextStyle(
    color: ColorManager.secondary,
    fontSize: adaptiveFontSize(12),
    fontWeight: FontWeight.w700,
  );

  static TextStyle style14BoldSec = TextStyle(
    color: ColorManager.secondary,
    fontSize: adaptiveFontSize(14),
    fontWeight: FontWeight.w700,
  );
  static TextStyle style14BoldBlack = TextStyle(
    color: ColorManager.black,
    fontSize: adaptiveFontSize(14),
    fontWeight: FontWeight.w700,
  );
  static TextStyle style16BoldBlack = TextStyle(
    color: ColorManager.black,
    fontSize: adaptiveFontSize(16),
    fontWeight: FontWeight.w700,
  );
  static TextStyle style14BoldGrey = TextStyle(
    color: ColorManager.grey,
    fontSize: adaptiveFontSize(14),
    fontWeight: FontWeight.w700,
  );
  static TextStyle style14BoldPrimary = TextStyle(
    color: ColorManager.primary,
    fontSize: adaptiveFontSize(14),
    fontWeight: FontWeight.w700,
  );
  static TextStyle style14BoldWhite = TextStyle(
    color: Colors.white,
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
  static TextStyle style12RegWhite = TextStyle(
    color: Colors.white,
    fontSize: adaptiveFontSize(12),
    fontWeight: FontWeight.w400,
  );
  static TextStyle style14RegSec = TextStyle(
    color: ColorManager.secondary,
    fontSize: adaptiveFontSize(14),
    fontWeight: FontWeight.w400,
  );

  static TextStyle style16BoldSec = TextStyle(
    color: ColorManager.secondary,
    fontSize: adaptiveFontSize(16),
    fontWeight: FontWeight.w700,
  );
  static TextStyle style20BoldBlack = TextStyle(
    color: ColorManager.black,
    fontSize: adaptiveFontSize(20),
    fontWeight: FontWeight.w700,
  );
}
