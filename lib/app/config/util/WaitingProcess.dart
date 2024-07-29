import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:storybook/app/config/constants/app_colors.dart';
import 'package:storybook/app/config/constants/app_fonts.dart';

class Waiting {
  static void show() {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.transparent,
      contentPadding: const EdgeInsetsDirectional.all(0),
      content: Container(
          width: 300,
          height: 130,
          decoration: BoxDecoration(
              color: AppColors.kLigth, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitCircle(
                  color: AppColors.kPrimaryColor,
                  size: 50.0,
                ),
                const SizedBox(height: 10),
                Text(
                  'Please wait...',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: appFontFamily(),
                      color: Colors.grey.shade700),
                )
              ],
            ),
          )),
    ));
  }

  static void hide() {
    if (Get.isDialogOpen!) Get.back();
  }
}
