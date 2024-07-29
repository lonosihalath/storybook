import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storybook/app/config/constants/app_colors.dart';
import 'package:storybook/app/config/constants/app_fonts.dart';

AppBar appbarApp({required String title}) {
  return AppBar(
    title: Text(
      title.tr,
      style: TextStyle(
          fontSize: 20,
          fontFamily: appFontFamily(),
          fontWeight: FontWeight.w600,
          color: AppColors.kLigth),
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: AppColors.kPrimaryColor,
    toolbarHeight: 60,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(19), bottomRight: Radius.circular(19))),
  );
}
