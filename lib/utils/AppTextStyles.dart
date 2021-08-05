import 'package:baseproject/utils/AppColors.dart';
import 'package:flutter/material.dart';

//TODO: CHANGE TEXT  STYLE COLORS
class AppTextStyles {
  static TextStyle appTextStyle({
    double fontSize,
    FontWeight fontWeight,
    Color color,
    double letterSpacing,
    double height,
  }) {
    return TextStyle(
      // fontFamily: Constant.fontFamily,
      fontSize: fontSize ?? 11,
      height: height,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.bgPrimary,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle appTextStyleWithDecoration(
      {double fontSize,
      FontWeight fontWeight,
      Color color,
      TextDecoration decoration,
      Color decorationColor}) {
    return TextStyle(
      // fontFamily: Constant.fontFamily,
      fontSize: fontSize ?? 11,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.bgPrimary,
      decoration: decoration ?? null,
      decorationColor: decorationColor ?? null,
    );
  }

  static TextStyle textFieldTextStyle({double fontSize}) {
    return TextStyle(
        // fontFamily: Constant.fontFamily,
        fontSize: fontSize ?? 16,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        color: AppColors.bgPrimary);
  }

  static TextStyle titleTextStyle(
      {double fontSize,
      FontWeight fontWeight,
      Color color,
      double letterSpacing}) {
    return TextStyle(
      // fontFamily: Constant.fontFamily,
      fontSize: fontSize ?? 16,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? AppColors.bgPrimary,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle hintTextStyle(
      {double fontSize, FontWeight fontWeight, Color color}) {
    return TextStyle(
      // fontFamily: Constant.fontFamily,
      fontSize: fontSize ?? 16,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? AppColors.bgPrimary.withOpacity(0.4),
    );
  }

  static TextStyle buttonTextStyle(
      {Color textColor, FontWeight fontWeight, double fontSize}) {
    return TextStyle(
      fontSize: fontSize ?? 16,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: textColor ?? AppColors.bgPrimary,
      // fontFamily: Constant.fontFamily,
    );
  }

  static TextStyle TextStyleWithFontFamily(
      {Color textColor,
      FontWeight fontWeight,
      double fontSize,
      String fontFamily}) {
    return TextStyle(
      fontSize: fontSize ?? 16,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: textColor ?? AppColors.bgPrimary,
      fontFamily: fontFamily,
    );
  }
}
