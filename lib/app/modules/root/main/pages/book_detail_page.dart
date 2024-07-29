import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:storybook/app/config/constants/app_assets.dart';
import 'package:storybook/app/config/constants/app_colors.dart';
import 'package:storybook/app/config/constants/app_fonts.dart';
import 'package:storybook/app/config/constants/app_text_styles.dart';
import 'package:storybook/app/config/util/image_widget.dart';
import 'package:storybook/app/modules/root/main/pages/delivery_page.dart';

import '../controllers/shopping_cart_controller/shopping_cart_controller.dart';

class BookDetailPageView extends GetView<ShoppingCartController> {
  const BookDetailPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingCartController>(
        initState: (state) {
          controller.setData();
        },
        builder: (controller) => Scaffold(
              bottomSheet: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 15, right: 15),
                height: 85,
                width: context.width,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                                height: 55,
                                width: context.width,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        backgroundColor:
                                            AppColors.kPrimaryColor),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add_shopping_cart,
                                            color: AppColors.kLigth),
                                        const SizedBox(width: 7),
                                        Text('Add to cart',
                                            style: AppTextStyles.textSize18(
                                                    context: context,
                                                    isBold: true)
                                                .copyWith(
                                                    color: AppColors.kLigth)),
                                      ],
                                    )))),
                        const SizedBox(width: 15),
                        Expanded(
                            child: SizedBox(
                                height: 55,
                                width: context.width,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        backgroundColor:
                                            AppColors.kPrimaryColor),
                                    onPressed: () {
                                      Get.to(() => const DeliveryPageView());
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.payment_rounded,
                                            color: AppColors.kLigth),
                                        const SizedBox(width: 7),
                                        Text('Buy now',
                                            style: AppTextStyles.textSize18(
                                                    context: context,
                                                    isBold: true)
                                                .copyWith(
                                                    color: AppColors.kLigth)),
                                      ],
                                    )))),
                      ],
                    )
                  ],
                ),
              ),
              backgroundColor: AppColors.kLigth,

              //   appBar: appbarApp(title: 'Book Detail'),
              body: Stack(
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: context.width,
                            height: 500,
                            child: imageWidget(url: controller.data.imageURL!),
                          ),
                        ],
                      )
                    ],
                  ),
                  Positioned(
                    top: 60,
                    left: 20,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: CircleAvatar(
                        radius: 23,
                        backgroundColor: AppColors.kLigth,
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.kPrimaryColor,
                          size: 27,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 20,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: CircleAvatar(
                        radius: 23,
                        backgroundColor: AppColors.kPrimaryColor,
                        child: SvgPicture.asset(
                          AppAssets.shoppingCart,
                          color: AppColors.kLigth,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        width: context.width,
                        height: context.height * .50,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.kTextInput,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              )
                            ],
                            color: AppColors.kLigth,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: context.width * .80,
                                  child: Text(
                                    controller.data.title!,
                                    style: AppTextStyles.textSize22(
                                        context: context, isBold: true),
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 23,
                                  backgroundColor: AppColors.kLigth,
                                  child: IconButton(
                                      style: const ButtonStyle(
                                          padding: MaterialStatePropertyAll(
                                              EdgeInsets.all(0))),
                                      onPressed: () {},
                                      icon: Icon(
                                        size: 30,
                                        Icons.favorite_border_rounded,
                                        color: AppColors.kPrimaryColor,
                                      )),
                                ),
                              ],
                            ),
                            Text(
                              '\$ ${controller.data.price}',
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.textSize22(
                                      context: context, isBold: true)
                                  .copyWith(
                                      color: AppColors.kPrimaryColor,
                                      fontFamily: AppFonsts.bdBold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Author : ${controller.data.author!}",
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.textSize15(
                                  context: context, isBold: false),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  "Rating : ",
                                  style: AppTextStyles.textSize15(
                                      context: context, isBold: false),
                                ),
                                const SizedBox(width: 7),
                                Icon(
                                  Icons.star_purple500_sharp,
                                  size: 23,
                                  color: AppColors.kPrimaryLight,
                                ),
                                const SizedBox(width: 7),
                                Text(
                                  controller.data.rating!.toString(),
                                  style: AppTextStyles.textSize15(
                                      context: context, isBold: false),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Description",
                              style: AppTextStyles.textSize20(
                                  context: context, isBold: true),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Explore the benefits of reading, from cognitive and emotional gains to discovering new genres. Learn strategies for better comprehension, navigate digital reading, and build a lasting reading habit. Perfect for both avid readers and newcomers, this ebook is your guide to the enchanting world of literature.",
                              style: AppTextStyles.textSize14(
                                  context: context, isBold: true),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ));
  }
}
