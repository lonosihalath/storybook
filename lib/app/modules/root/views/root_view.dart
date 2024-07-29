import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storybook/app/config/constants/app_colors.dart';
import 'package:storybook/app/config/constants/app_fonts.dart';
import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootController>(
        builder: (controller) => Scaffold(
              backgroundColor: Colors.orange,
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/logo png.png',
                      width: 200,
                    ),
                    // const SizedBox(height: 20),
                    Text('StoryBook',
                        style: TextStyle(
                            fontSize: 25,
                            color: AppColors.kLigth,
                            fontFamily: AppFonsts.bdSemiBold))
                  ],
                )),
              ),
            ));
  }
}
