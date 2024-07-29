import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:storybook/app/config/constants/app_assets.dart';
import 'package:storybook/app/config/constants/app_colors.dart';
import 'package:storybook/app/modules/root/main/pages/shopping_cart.dart';
import 'package:storybook/app/modules/root/main/widgets/main_widget.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColors.kLigth,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endDocked,
              floatingActionButton: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(context.width)),
                backgroundColor: AppColors.kPrimaryColor,
                onPressed: () {
                  Get.to(() => const ShoppingCartView());
                },
                child: SvgPicture.asset(
                  AppAssets.shoppingCart,
                  color: AppColors.kLigth,
                  width: 25,
                ),
              ),
              bottomNavigationBar: const BottomNavigationWidget(),
              body: controller.page(),
            ));
  }
}
