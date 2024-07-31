import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:storybook/app/config/constants/app_assets.dart';
import 'package:storybook/app/config/constants/app_colors.dart';
import 'package:storybook/app/config/constants/app_text_styles.dart';
import 'package:storybook/app/modules/root/main/controllers/shopping_cart_controller/shopping_cart_controller.dart';
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
              floatingActionButton: GetBuilder<ShoppingCartController>(
                init: ShoppingCartController(),
                builder: (controllerShoping) {
                  return Stack(
                    children: [
                      FloatingActionButton(
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
                      controllerShoping.addCart.isNotEmpty
                          ? Positioned(
                              right: 0,
                              child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.red,
                                  child: Text(
                                    controllerShoping.addCart.length.toString(),
                                    style: AppTextStyles.textSize12(
                                            context: context, isBold: false)
                                        .copyWith(color: AppColors.kLigth),
                                  )))
                          : const SizedBox()
                    ],
                  );
                },
              ),
              bottomNavigationBar: const BottomNavigationWidget(),
              body: controller.page(),
            ));
  }
}
