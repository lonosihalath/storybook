import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:storybook/app/config/constants/app_assets.dart';
import 'package:storybook/app/config/constants/app_colors.dart';
import 'package:storybook/app/modules/root/main/controllers/main_controller.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        builder: (controller) => StylishBottomBar(
              elevation: 0,
              option: AnimatedBarOptions(
                barAnimation: BarAnimation.fade,
                iconStyle: IconStyle.Default,
              ),
              items: [
                BottomBarItem(
                    icon: iconWidget(AppAssets.iHome, false),
                    title: titleWidget("Home"),
                    selectedIcon: iconWidget(AppAssets.iHome, true),
                    selectedColor: AppColors.kPrimaryColor),
                BottomBarItem(
                    icon: iconWidget(AppAssets.search, false),
                    title: titleWidget("Search"),
                    selectedIcon: iconWidget(AppAssets.search, true),
                    selectedColor: AppColors.kPrimaryColor),
                BottomBarItem(
                    icon: iconWidget(AppAssets.wishlist, false),
                    selectedIcon: iconWidget(AppAssets.wishlist, true),
                    title: titleWidget("wishlist"),
                    selectedColor: AppColors.kPrimaryColor),
                BottomBarItem(
                    icon: iconWidget(AppAssets.setting, false),
                    selectedIcon: iconWidget(AppAssets.setting, true),
                    title: titleWidget('Setting'),
                    selectedColor: AppColors.kPrimaryColor),
              ],
              fabLocation: StylishBarFabLocation.end,
              hasNotch: true,
              currentIndex: controller.currentIndex.value,
              onTap: (value) {
                controller.selectBottomBar(value);
              },
            ));
  }

  Widget titleWidget(String text) => Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      );

  Widget iconWidget(String icon, bool active) => SvgPicture.asset(
        icon,
        fit: BoxFit.cover,
        height: 25,
        colorFilter: ColorFilter.mode(
          active ? AppColors.kPrimaryColor : Colors.grey,
          BlendMode.srcIn,
        ),
      );
}
