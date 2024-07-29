import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storybook/app/config/constants/app_colors.dart';
import 'package:storybook/app/config/constants/app_fonts.dart';
import 'package:storybook/app/config/constants/app_text_styles.dart';
import 'package:storybook/app/config/util/app_text_form_field.dart';
import 'package:storybook/app/modules/root/auth/controllers/auth_controller.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColors.kLigth,
              appBar: AppBar(
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(25),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(
                            onTap: () => Get.back(),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: AppColors.kPrimaryColor,
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: AppColors.kLigth,
                                size: 27,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                backgroundColor: AppColors.kLigth,
                surfaceTintColor: AppColors.kLigth,
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        'assets/icons/logo.jpg',
                        width: 150,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Register',
                      style: AppTextStyles.textSize25(
                          context: context, isBold: true),
                    ),
                    const SizedBox(height: 40),
                    AppTextFormFieldWidget(
                      controller: controller.name,
                      hintText: 'firstName',
                      style: TextStyle(fontFamily: appFontFamily()),
                      perfixIcon: const Icon(Icons.person),
                    ),
                    const SizedBox(height: 15),
                    AppTextFormFieldWidget(
                      controller: controller.emailRegister,
                      hintText: 'email',
                      perfixIcon: const Icon(Icons.email),
                      style: TextStyle(fontFamily: appFontFamily()),
                    ),
                    const SizedBox(height: 15),
                    AppTextFormFieldWidget(
                      controller: controller.date,
                      ontap: () {
                        controller.selectDate(context: context);
                      },
                      readOnly: true,
                      style: TextStyle(fontFamily: appFontFamily()),
                      hintText: 'date',
                      perfixIcon: const Icon(Icons.date_range),
                    ),
                    const SizedBox(height: 15),
                    AppTextFormFieldWidget(
                      controller: controller.passwordRegister,
                      obscureText: controller.obscureTextRegister.value,
                      hintText: 'password',
                      style: TextStyle(fontFamily: appFontFamily()),
                      perfixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.setObscureTextPasswordRegister(type: '');
                          },
                          icon: controller.obscureTextRegister.isTrue
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                    ),
                    const SizedBox(height: 15),
                    AppTextFormFieldWidget(
                      controller: controller.cfPasswordRegister,
                      obscureText: controller.obscureTextcfRegister.value,
                      hintText: ' confirm Password',
                      style: TextStyle(fontFamily: appFontFamily()),
                      perfixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.setObscureTextPasswordRegister(
                                type: 'confirm');
                          },
                          icon: controller.obscureTextcfRegister.isTrue
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                        height: 50,
                        width: context.width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.kPrimaryColor),
                            onPressed: () {
                              controller.register();
                            },
                            child: Text('Register',
                                style: AppTextStyles.textSize20(
                                        context: context, isBold: false)
                                    .copyWith(color: AppColors.kLigth)))),
                  ],
                ),
              ),
            ));
  }
}
