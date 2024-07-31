import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storybook/app/config/constants/app_Appbar.dart';
import 'package:storybook/app/config/constants/app_colors.dart';
import 'package:storybook/app/config/constants/app_fonts.dart';
import 'package:storybook/app/config/util/image_widget.dart';
import 'package:storybook/app/modules/root/main/controllers/payment_controller/payment_controller.dart';

import '../../../../config/constants/app_text_styles.dart';

class PayMentPageView extends GetView<PaymentController> {
  const PayMentPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
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
                              onPressed: () => controller.confirmPayment(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Confirm payment',
                                      style: AppTextStyles.textSize18(
                                              context: context, isBold: true)
                                          .copyWith(color: AppColors.kLigth)),
                                ],
                              ))),
                    ),
                  ],
                ),
              ),
              appBar: appbarApp(title: 'Payment'),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Products',
                        style: AppTextStyles.textSize19(
                            context: context, isBold: true),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: context.width,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: AppColors.kLigth,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Column(
                              children: controller.cartController.addCart
                                  .map((element) => SizedBox(
                                        width: context.width,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 65,
                                                  height: 65,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    child: imageWidget(
                                                        url: element.imageURL!),
                                                  ),
                                                ),
                                                const SizedBox(width: 15),
                                                Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        element.title!,
                                                        style: AppTextStyles
                                                                .textSize12(
                                                                    context:
                                                                        context,
                                                                    isBold:
                                                                        true)
                                                            .copyWith(
                                                                fontFamily:
                                                                    AppFonsts
                                                                        .bdBold),
                                                      ),
                                                      Text(
                                                        'author: ${element.author}',
                                                        style: AppTextStyles
                                                            .textSize11(
                                                                context:
                                                                    context,
                                                                isBold: true),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Rating:  ',
                                                            style: AppTextStyles
                                                                .textSize11(
                                                              context: context,
                                                              isBold: true,
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.star,
                                                                color: AppColors
                                                                    .kPrimaryColor,
                                                                size: 15,
                                                              ),
                                                              Text(
                                                                '  ${element.rating}',
                                                                style: AppTextStyles
                                                                    .textSize11(
                                                                  context:
                                                                      context,
                                                                  isBold: true,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        '\$ ${element.price}',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: AppTextStyles
                                                            .textSize14(
                                                          context: context,
                                                          isBold: true,
                                                        ).copyWith(
                                                          color: AppColors
                                                              .kPrimaryColor,
                                                          fontFamily:
                                                              AppFonsts.bdBold,
                                                        ),
                                                      ),
                                                    ]),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            const Divider(
                                              height: .1,
                                              color: Colors.black12,
                                            ),
                                            const SizedBox(height: 10),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total :',
                                  style: AppTextStyles.textSize19(
                                          context: context, isBold: true)
                                      .copyWith(
                                          color: AppColors.kPrimaryColor,
                                          fontFamily: AppFonsts.bdBold),
                                ),
                                Text(
                                  '\$  ${controller.cartController.getPrice()}',
                                  style: AppTextStyles.textSize19(
                                          context: context, isBold: true)
                                      .copyWith(
                                          color: AppColors.kPrimaryColor,
                                          fontFamily: AppFonsts.bdBold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Delivery',
                        style: AppTextStyles.textSize19(
                            context: context, isBold: true),
                      ),
                      const SizedBox(height: 10),
                      Card(
                        margin: const EdgeInsetsDirectional.all(0),
                        elevation: 0,
                        color: AppColors.kLigth,
                        surfaceTintColor: AppColors.kLigth,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 10, top: 8, bottom: 5),
                          width: context.width,
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.maps_home_work_outlined,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Village: ${controller.deliveryController.selectDelivery.value!.delVillage ?? ""}",
                                    style: AppTextStyles.textSize13(
                                            context: context, isBold: false)
                                        .copyWith(
                                            fontFamily: AppFonsts.bdMedium),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.maps_home_work_outlined,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "District: ${controller.deliveryController.selectDelivery.value!.delDistrict ?? ""}",
                                    style: AppTextStyles.textSize13(
                                            context: context, isBold: false)
                                        .copyWith(
                                            fontFamily: AppFonsts.bdMedium),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.maps_home_work_outlined,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Province: ${controller.deliveryController.selectDelivery.value!.delProvince ?? ""}",
                                    style: AppTextStyles.textSize13(
                                            context: context, isBold: false)
                                        .copyWith(
                                            fontFamily: AppFonsts.bdMedium),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.phone_in_talk,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Phone: ${controller.deliveryController.selectDelivery.value!.delPhone ?? ""}",
                                    style: AppTextStyles.textSize13(
                                            context: context, isBold: false)
                                        .copyWith(
                                            fontFamily: AppFonsts.bdMedium),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Payment',
                        style: AppTextStyles.textSize19(
                            context: context, isBold: true),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => controller.uploadPayment(),
                        child: Container(
                            padding: const EdgeInsets.all(15),
                            width: context.width,
                            height: 250,
                            decoration: BoxDecoration(
                                color: AppColors.kLigth,
                                borderRadius: BorderRadius.circular(10)),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                controller.paymentUpload == null
                                    ? Center(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.photo_camera,
                                                color: AppColors.kPrimaryColor,
                                                size: 30,
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                'Payment uploed',
                                                style: AppTextStyles.textSize14(
                                                    context: context,
                                                    isBold: false),
                                              )
                                            ]),
                                      )
                                    : Image.file(
                                        File(controller.paymentUpload!.path),
                                        fit: BoxFit.fitHeight,
                                      ),
                                controller.paymentUpload == null
                                    ? const SizedBox()
                                    : Positioned(
                                        right: 0,
                                        top: 0,
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundColor:
                                              AppColors.kPrimaryColor,
                                          child: IconButton(
                                            onPressed: () {
                                              controller.uploadPayment();
                                            },
                                            icon: (Icon(
                                              Icons.edit,
                                              color: AppColors.kLigth,
                                            )),
                                          ),
                                        ))
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
