import 'package:flutter/material.dart';
import 'package:storybook/app/config/constants/app_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Method to get a TextStyle based on provided parameters and context
  static TextStyle getTextStyle({
    required BuildContext context,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: appFontFamily(),
      fontSize: fontSize ?? 10,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: AppColors.kTextOrther,
      letterSpacing: letterSpacing ?? 0,
    );
  }

  // Predefined text styles using context for flexible sizing
  static TextStyle textSize10(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 10,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize11(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 11,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize12(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 12,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize13(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 13,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize14(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 14,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize15(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 15,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize16(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 16,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize17(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 17,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize18(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 17,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize19(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 19,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize20(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 20,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize21(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 21,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize22(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 22,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize23(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 23,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize24(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 24,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize25(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 25,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize26(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 26,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize27(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 27,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize28(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 28,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize29(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 29,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
  static TextStyle textSize30(
          {required BuildContext context, required bool isBold}) =>
      getTextStyle(
        context: context,
        fontSize: 30,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
}
