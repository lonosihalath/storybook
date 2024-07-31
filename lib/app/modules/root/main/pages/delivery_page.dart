import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:storybook/app/config/constants/app_Appbar.dart';
import 'package:storybook/app/config/constants/app_assets.dart';
import 'package:storybook/app/config/constants/app_fonts.dart';
import 'package:storybook/app/config/constants/app_text_styles.dart';
import 'package:storybook/app/modules/root/main/controllers/delivery_controller/delivery_controller.dart';
import 'package:storybook/app/modules/root/main/pages/add_delivery_page.dart';
import 'package:storybook/app/modules/root/main/pages/payment_page.dart';

import '../../../../config/constants/app_colors.dart';

class DeliveryPageView extends GetView<DeliveryController> {
  const DeliveryPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryController>(
        initState: (state) {
          controller.getDelivery();
        },
        builder: (controller) => Scaffold(
              backgroundColor: AppColors.kBackground,
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
                                if (controller.selectDelivery.value != null) {
                                  Get.to(() => const PayMentPageView());
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Payment',
                                      style: AppTextStyles.textSize18(
                                              context: context, isBold: true)
                                          .copyWith(color: AppColors.kLigth)),
                                ],
                              ))),
                    ),
                  ],
                ),
              ),
              appBar: appbarApp(title: 'Delivery'),
              body: Container(
                width: context.width,
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Choose delivery',
                              style: AppTextStyles.textSize18(
                                  context: context, isBold: false),
                            ),
                            TextButton(
                                onPressed: () =>
                                    Get.to(() => const AddDeliveryPageView()),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: AppColors.kPrimaryColor,
                                      size: 20,
                                    ),
                                    Text(
                                      'Add delivery',
                                      style: AppTextStyles.textSize15(
                                              context: context, isBold: true)
                                          .copyWith(
                                              color: AppColors.kPrimaryColor),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      controller.isLoading.isFalse
                          ? controller
                                  .listDelivery.value.deliveryDetail!.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 50),
                                  child: Column(
                                    children: [
                                      Text(
                                        'No delivery found',
                                        style: AppTextStyles.textSize18(
                                                context: context, isBold: false)
                                            .copyWith(
                                                fontFamily: AppFonsts.bdMedium),
                                      ),
                                      const SizedBox(height: 20),
                                      SizedBox(
                                          height: 40,
                                          width: context.width * .40,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  backgroundColor:
                                                      AppColors.kPrimaryColor),
                                              onPressed: () {
                                                Get.to(() =>
                                                    const AddDeliveryPageView());
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.add_circle,
                                                    size: 20,
                                                    color: AppColors.kLigth,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Text('Add Delivery',
                                                      style: AppTextStyles
                                                              .textSize14(
                                                                  context:
                                                                      context,
                                                                  isBold: true)
                                                          .copyWith(
                                                              color: AppColors
                                                                  .kLigth)),
                                                ],
                                              ))),
                                    ],
                                  ),
                                )
                              : Column(
                                  children: controller
                                      .listDelivery.value.deliveryDetail!
                                      .map((e) => Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 15),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () => controller
                                                      .selectDeliveryItem(
                                                          value: e),
                                                  child: Card(
                                                    color: AppColors.kLigth,
                                                    margin:
                                                        const EdgeInsetsDirectional
                                                            .all(0),
                                                    elevation: .5,
                                                    surfaceTintColor:
                                                        AppColors.kLigth,
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              top: 8,
                                                              bottom: 5),
                                                      width: context.width,
                                                      height: 110,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                Icons
                                                                    .maps_home_work_outlined,
                                                                color:
                                                                    Colors.grey,
                                                                size: 20,
                                                              ),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Text(
                                                                "Village: ${e.delVillage ?? ""}",
                                                                style: AppTextStyles.textSize13(
                                                                        context:
                                                                            context,
                                                                        isBold:
                                                                            false)
                                                                    .copyWith(
                                                                        fontFamily:
                                                                            AppFonsts.bdMedium),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              height: 5),
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                Icons
                                                                    .maps_home_work_outlined,
                                                                color:
                                                                    Colors.grey,
                                                                size: 20,
                                                              ),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Text(
                                                                "District: ${e.delDistrict ?? ""}",
                                                                style: AppTextStyles.textSize13(
                                                                        context:
                                                                            context,
                                                                        isBold:
                                                                            false)
                                                                    .copyWith(
                                                                        fontFamily:
                                                                            AppFonsts.bdMedium),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              height: 5),
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                Icons
                                                                    .maps_home_work_outlined,
                                                                color:
                                                                    Colors.grey,
                                                                size: 20,
                                                              ),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Text(
                                                                "Province: ${e.delProvince ?? ""}",
                                                                style: AppTextStyles.textSize13(
                                                                        context:
                                                                            context,
                                                                        isBold:
                                                                            false)
                                                                    .copyWith(
                                                                        fontFamily:
                                                                            AppFonsts.bdMedium),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              height: 5),
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                Icons
                                                                    .phone_in_talk,
                                                                color:
                                                                    Colors.grey,
                                                                size: 20,
                                                              ),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Text(
                                                                "Phone: ${e.delPhone ?? ""}",
                                                                style: AppTextStyles.textSize13(
                                                                        context:
                                                                            context,
                                                                        isBold:
                                                                            false)
                                                                    .copyWith(
                                                                        fontFamily:
                                                                            AppFonsts.bdMedium),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 20,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 0),
                                                    child: Transform.scale(
                                                      scale: 1.3,
                                                      child: SizedBox(
                                                        width: 20,
                                                        child: Radio(
                                                            activeColor: AppColors
                                                                .kPrimaryColor,
                                                            value: controller
                                                                .selectDelivery
                                                                .value!
                                                                .deliveryId,
                                                            groupValue:
                                                                e.deliveryId,
                                                            onChanged: (_) {
                                                              controller
                                                                  .selectDeliveryItem(
                                                                      value: e);
                                                            }),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                )
                          : Container(
                              padding: const EdgeInsets.only(top: 60),
                              child: Center(
                                  child: Column(
                                children: [
                                  CircularProgressIndicator(
                                      color: AppColors.kPrimaryLight),
                                  const SizedBox(height: 20),
                                  Text(
                                    'Loading...',
                                    style: AppTextStyles.textSize18(
                                        context: context, isBold: false),
                                  ),
                                ],
                              )),
                            )
                    ],
                  ),
                ),
              ),
            ));
  }
}
