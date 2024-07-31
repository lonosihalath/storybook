import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storybook/app/config/constants/app_Appbar.dart';
import 'package:storybook/app/config/constants/app_colors.dart';
import 'package:storybook/app/config/constants/app_fonts.dart';
import 'package:storybook/app/config/constants/app_text_styles.dart';
import 'package:storybook/app/config/util/image_widget.dart';
import 'package:storybook/app/modules/root/main/pages/delivery_page.dart';

import '../controllers/shopping_cart_controller/shopping_cart_controller.dart';

class ShoppingCartView extends GetView<ShoppingCartController> {
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingCartController>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.kBackground,
        appBar: appbarApp(title: 'Shopping cart'),
        bottomNavigationBar: controller.addCart.isEmpty
            ? const SizedBox()
            : SizedBox(
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
                              onPressed: () =>
                                  Get.to(() => const DeliveryPageView()),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Continue',
                                      style: AppTextStyles.textSize18(
                                              context: context, isBold: true)
                                          .copyWith(color: AppColors.kLigth)),
                                ],
                              ))),
                    ),
                  ],
                ),
              ),
        body: controller.addCart.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_basket_rounded,
                        color: AppColors.kPrimaryColor, size: 50),
                    const SizedBox(height: 10),
                    Text(
                      'No item in cart',
                      style: AppTextStyles.textSize18(
                          context: context, isBold: false),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: controller.addCart.asMap().entries.map((e) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Card(
                              elevation: 0,
                              surfaceTintColor: AppColors.kLigth,
                              color: AppColors.kLigth,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                width: context.width,
                                height: 110,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: imageWidget(
                                          url: e.value.imageURL!,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e.value.title!,
                                            style: AppTextStyles.textSize16(
                                                context: context, isBold: true),
                                          ),
                                          Text(
                                            'author: ${e.value.author}',
                                            style: AppTextStyles.textSize14(
                                                context: context, isBold: true),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Rating:  ',
                                                style: AppTextStyles.textSize14(
                                                    context: context,
                                                    isBold: true),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        AppColors.kPrimaryColor,
                                                    size: 15,
                                                  ),
                                                  Text(
                                                    '  ${e.value.rating}',
                                                    style: AppTextStyles
                                                        .textSize14(
                                                            context: context,
                                                            isBold: true),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '\$ ${controller.data.price}',
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTextStyles.textSize19(
                                                    context: context,
                                                    isBold: true)
                                                .copyWith(
                                                    color:
                                                        AppColors.kPrimaryColor,
                                                    fontFamily:
                                                        AppFonsts.bdBold),
                                          ),
                                        ]),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                right: 10,
                                child: IconButton(
                                    onPressed: () => controller.removeCartData(
                                        dataList: e.value),
                                    icon: const Icon(
                                      Icons.delete_sweep,
                                      color: Colors.red,
                                      size: 30,
                                    )))
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
      ),
    );
  }
}
