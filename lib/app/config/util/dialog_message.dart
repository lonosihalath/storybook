import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:storybook/app/config/constants/app_assets.dart';
import 'package:storybook/app/config/constants/app_colors.dart';
import 'package:storybook/app/config/constants/app_text_styles.dart';

enum SnackBarType { info, success, warning, error }

class SnackBarHelper {
  static IconData snackBarIcon(SnackBarType snackBarType) {
    switch (snackBarType) {
      case SnackBarType.success:
        return Icons.check_circle_rounded;
      case SnackBarType.error:
        return Icons.cancel;
      case SnackBarType.info:
        return Icons.info;
      case SnackBarType.warning:
        return Icons.warning_rounded;
      default:
        return Icons.info;
    }
  }

  static String snackBarTitle(SnackBarType snackBarType) {
    switch (snackBarType) {
      case SnackBarType.success:
        return "Success";
      case SnackBarType.error:
        return "Error";
      case SnackBarType.info:
        return "Info";
      case SnackBarType.warning:
        return "Warning";
      default:
        return "";
    }
  }

  static Color snackBarColor(SnackBarType snackBarType) {
    switch (snackBarType) {
      case SnackBarType.success:
        return AppColors.colorSuccess;
      case SnackBarType.error:
        return AppColors.colorError;
      case SnackBarType.info:
        return AppColors.colorInfo;
      case SnackBarType.warning:
        return AppColors.colorWarning;
      default:
        return AppColors.kLigth;
    }
  }

  static void showSnackBar(
      {required BuildContext context,
      required SnackBarType snackBarType,
      required String message,
      String? title,
      Key? key}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      key: key,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: GestureDetector(
        onTap: () => ScaffoldMessenger.of(context).clearSnackBars(),
        child: Container(
            decoration: BoxDecoration(
              color: AppColors.kLigth,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x19000000),
                  spreadRadius: 2.0,
                  blurRadius: 8.0,
                  offset: Offset(2, 4),
                )
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 90,
                  child: SvgPicture.asset(
                    AppAssets.appBG,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      snackBarColor(snackBarType).withOpacity(0.4),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 8),
                    Icon(
                      snackBarIcon(snackBarType),
                      color: snackBarColor(snackBarType),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(title ?? snackBarTitle(snackBarType),
                                style: AppTextStyles.textSize16(
                                    context: context, isBold: true)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(message,
                                style: AppTextStyles.textSize15(
                                    context: context, isBold: false)),
                          ),
                        ],
                      ),
                    )),
                    Icon(
                      Icons.close,
                      color: AppColors.kTextOrther,
                    ),
                    const SizedBox(width: 8)
                  ],
                ),
              ],
            )),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
