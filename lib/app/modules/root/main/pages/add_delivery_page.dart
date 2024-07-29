import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:storybook/app/config/constants/app_Appbar.dart';
import 'package:storybook/app/config/constants/app_assets.dart';
import 'package:storybook/app/config/constants/app_colors.dart';
import 'package:storybook/app/config/constants/app_fonts.dart';
import 'package:storybook/app/config/constants/app_text_styles.dart';
import 'package:storybook/app/config/util/app_text_form_field.dart';
import 'package:storybook/app/modules/root/main/controllers/delivery_controller/delivery_controller.dart';

class AddDeliveryPageView extends GetView<DeliveryController> {
  const AddDeliveryPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryController>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: SizedBox(
          height: 80,
          width: context.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                    height: 55,
                    width: context.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: AppColors.kPrimaryColor),
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.addDelivery();
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Confirm',
                                style: AppTextStyles.textSize18(
                                        context: context, isBold: true)
                                    .copyWith(color: AppColors.kLigth)),
                          ],
                        ))),
              ),
            ],
          ),
        ),
        appBar: appbarApp(title: 'Add Delivery'),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAssets.delivery,
                    width: context.width * .60,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Delivery',
                    style: AppTextStyles.textSize25(
                        context: context, isBold: true),
                  ),
                  const SizedBox(height: 20),
                  AppTextFormFieldWidget(
                    hintStyle: const TextStyle(color: Colors.grey),
                    controller: controller.villageController,
                    perfixIcon: const Icon(
                      Icons.maps_home_work_outlined,
                      color: Colors.grey,
                    ),
                    hintText: 'Village',
                    validator: 'Village is required',
                    style: TextStyle(fontFamily: appFontFamily()),
                  ),
                  const SizedBox(height: 20),
                  AppTextFormFieldWidget(
                    hintStyle: const TextStyle(color: Colors.grey),
                    controller: controller.disterictController,
                    perfixIcon: const Icon(
                      Icons.maps_home_work_outlined,
                      color: Colors.grey,
                    ),
                    hintText: 'District',
                    validator: 'District is required',
                    style: TextStyle(fontFamily: appFontFamily()),
                  ),
                  const SizedBox(height: 20),
                  AppTextFormFieldWidget(
                    hintStyle: const TextStyle(color: Colors.grey),
                    controller: controller.provinController,
                    perfixIcon: const Icon(
                      Icons.maps_home_work_outlined,
                      color: Colors.grey,
                    ),
                    hintText: 'Province',
                    validator: 'Province is required',
                    style: TextStyle(fontFamily: appFontFamily()),
                  ),
                  const SizedBox(height: 20),
                  AppTextFormFieldWidget(
                    hintStyle: const TextStyle(color: Colors.grey),
                    controller: controller.phoneController,
                    keyboardType: TextInputType.number,
                    inputFormatter: FilteringTextInputFormatter.digitsOnly,
                    perfixIcon: const Icon(
                      Icons.phone_in_talk_rounded,
                      color: Colors.grey,
                    ),
                    hintText: 'Phone Number',
                    validator: 'Phone Number is required',
                    style: TextStyle(fontFamily: appFontFamily()),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
