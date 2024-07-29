import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storybook/app/config/constants/app_colors.dart';
import 'package:storybook/app/config/constants/app_fonts.dart';
import 'package:storybook/app/config/constants/app_text_styles.dart';
import 'package:storybook/app/config/util/app_text_form_field.dart';
import 'package:storybook/app/modules/root/auth/views/register_view.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColors.kLigth,
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        'Login',
                        style: AppTextStyles.textSize25(
                            context: context, isBold: true),
                      ),
                      const SizedBox(height: 30),
                      AppTextFormFieldWidget(
                        controller: controller.email,
                        hintStyle: const TextStyle(color: Colors.grey),
                        perfixIcon: const Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        hintText: 'Email',
                        style: TextStyle(fontFamily: appFontFamily()),
                      ),
                      const SizedBox(height: 20),
                      AppTextFormFieldWidget(
                        obscureText: controller.obscureText.value,
                        controller: controller.password,
                        hintStyle: const TextStyle(color: Colors.grey),
                        perfixIcon: const Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        hintText: 'Password',
                        style: TextStyle(fontFamily: appFontFamily()),
                        suffixIcon: IconButton(
                            onPressed: () => controller.setObscureText(),
                            icon: Icon(
                              controller.obscureText.isTrue
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            )),
                      ),
                      const SizedBox(height: 10),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Not have account ?    ',
                                style: AppTextStyles.textSize16(
                                        context: context, isBold: false)
                                    .copyWith(color: AppColors.kTextOrther),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const RegisterView());
                                },
                                child: Text(
                                  'Register',
                                  style: AppTextStyles.textSize16(
                                          context: context, isBold: false)
                                      .copyWith(color: AppColors.kPrimaryColor),
                                ),
                              ),
                              const SizedBox(width: 10),
                            ],
                          )),
                      const SizedBox(height: 40),
                      SizedBox(
                          height: 50,
                          width: context.width,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.kPrimaryColor),
                              onPressed: () {
                                controller.login();
                              },
                              child: Text('Login',
                                  style: AppTextStyles.textSize20(
                                          context: context, isBold: false)
                                      .copyWith(color: AppColors.kLigth)))),
                    ],
                  ),
                ),
              ),
            ));
  }
}
