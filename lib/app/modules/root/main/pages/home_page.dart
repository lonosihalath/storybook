import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:storybook/app/config/constants/app_assets.dart';
import 'package:storybook/app/config/constants/app_colors.dart';
import 'package:storybook/app/config/constants/app_fonts.dart';
import 'package:storybook/app/config/constants/app_text_styles.dart';
import 'package:storybook/app/config/util/image_widget.dart';
import 'package:storybook/app/modules/root/main/controllers/home_controller/home_controller.dart';
import 'package:storybook/app/modules/root/main/pages/book_detail_page.dart';

import '../../../../config/localStore/dataStorage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColors.kBackground,
              drawerEdgeDragWidth: 0,
              drawer: Drawer(
                backgroundColor: AppColors.kLigth,
                surfaceTintColor: AppColors.kLigth,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 280,
                          child: DrawerHeader(
                              margin: const EdgeInsets.only(bottom: 0),
                              decoration:
                                  BoxDecoration(color: AppColors.kPrimaryColor),
                              child: SizedBox(
                                width: context.width,
                                height: 300,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 50,
                                      backgroundColor: AppColors.kLigth,
                                      child:
                                          SvgPicture.asset(AppAssets.profile),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      Storage.getUserInfo.firstName!,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.textSize22(
                                              context: context, isBold: false)
                                          .copyWith(
                                              color: AppColors.kLigth,
                                              fontFamily: AppFonsts.bdBlack),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      Storage.getUserInfo.email!,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.textSize15(
                                              context: context, isBold: false)
                                          .copyWith(color: AppColors.kLigth),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        const SizedBox(height: 10),
                        ListTile(
                          onTap: () {},
                          title: Text('My Account',
                              style: AppTextStyles.textSize19(
                                  context: context, isBold: false)),
                          leading: const Icon(
                            Icons.person_outline_rounded,
                            size: 25,
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            ListTile(
                              onTap: () {},
                              title: Text('History',
                                  style: AppTextStyles.textSize19(
                                          context: context, isBold: false)
                                      .copyWith(color: AppColors.kTextOrther)),
                              leading: SvgPicture.asset(AppAssets.orderHistory),
                            ),
                            Positioned(
                                right: 10,
                                child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 10,
                                    child: Text(
                                      '1',
                                      style: AppTextStyles.textSize11(
                                              context: context, isBold: false)
                                          .copyWith(color: AppColors.kLigth),
                                    )))
                          ],
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 20),
                      child: SizedBox(
                          height: 50,
                          width: context.width,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: AppColors.kPrimaryColor),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.logout, color: AppColors.kLigth),
                                  const SizedBox(width: 10),
                                  Text('Logout',
                                      style: AppTextStyles.textSize20(
                                              context: context, isBold: false)
                                          .copyWith(color: AppColors.kLigth)),
                                ],
                              ))),
                    ),
                  ],
                ),
              ),
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.kPrimaryColor,
                surfaceTintColor: AppColors.kPrimaryColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.kLigth,
                          child: SvgPicture.asset(AppAssets.profile),
                        ),
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 6),
                          Text(
                            'STORYBOOK',
                            style: AppTextStyles.textSize23(
                                    context: context, isBold: true)
                                .copyWith(color: AppColors.kLigth),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.notifications_active,
                      color: AppColors.kLigth,
                      size: 30,
                    )
                  ],
                ),
                centerTitle: true,
                elevation: 0,
                toolbarHeight: 80,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 200,
                            width: context.width,
                            child: CarouselSlider.builder(
                              itemCount: controller.images.length,
                              options: CarouselOptions(
                                autoPlay: true,
                                aspectRatio: 1.0,
                                viewportFraction: 1,
                                enlargeCenterPage: true,
                                onPageChanged: (index, reason) {
                                  controller.currentIndexImage.value = index;
                                  controller.update();
                                },
                              ),
                              itemBuilder: (context, index, realIdx) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, top: 15, right: 15, bottom: 9),
                                  child: Center(
                                      child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      child: imageWidget(
                                        url: controller.images[index],
                                      ),
                                    ),
                                  )),
                                );
                              },
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              controller.images.length,
                              (index) => Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    width: controller.currentIndexImage.value ==
                                            index
                                        ? 25
                                        : 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          AppColors.kPrimaryLight,
                                          AppColors.kPrimaryColor,
                                        ]),
                                        borderRadius: BorderRadius.circular(
                                            context.width)),
                                  )),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 9),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Category',
                                    style: AppTextStyles.textSize22(
                                        context: context, isBold: true),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      'See all >',
                                      style: AppTextStyles.textSize15(
                                              context: context, isBold: false)
                                          .copyWith(
                                              color: AppColors.kPrimaryColor,
                                              fontFamily: AppFonsts.bdBold),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: Storage.getCategoryInfo
                                      .map((e) => Card(
                                          elevation: 0,
                                          margin: const EdgeInsets.only(
                                              right: 10, bottom: 5, top: 5),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      context.width)),
                                          color: AppColors.kLigth,
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 20),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    AppAssets.logoPNG,
                                                    width: 25,
                                                    color:
                                                        AppColors.kPrimaryColor,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    e.catName!,
                                                    style: AppTextStyles
                                                        .textSize15(
                                                            context: context,
                                                            isBold: false),
                                                  ),
                                                ],
                                              ))))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Products',
                                style: AppTextStyles.textSize22(
                                    context: context, isBold: true),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Text(
                                  'See all >',
                                  style: AppTextStyles.textSize15(
                                          context: context, isBold: false)
                                      .copyWith(
                                          color: AppColors.kPrimaryColor,
                                          fontFamily: AppFonsts.bdBold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 9),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: SizedBox(
                                  width: context.width,
                                  child: GridView.count(
                                    padding: const EdgeInsets.all(4.0),
                                    childAspectRatio: 8.0 / 13.5,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 2,
                                    children: Storage.getListBooksInfo
                                        .map((element) => GestureDetector(
                                              onTap: () => Get.to(
                                                  () =>
                                                      const BookDetailPageView(),
                                                  arguments: {"book": element}),
                                              child: GridTile(
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      width: context.width,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(18),
                                                          color:
                                                              AppColors.kLigth),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 10,
                                                                    top: 10,
                                                                    right: 10),
                                                            child: SizedBox(
                                                              height: 230,
                                                              width:
                                                                  context.width,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                child: imageWidget(
                                                                    url: element
                                                                        .imageURL!),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  element
                                                                      .title!,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: AppTextStyles.textSize18(
                                                                      context:
                                                                          context,
                                                                      isBold:
                                                                          false),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .star_purple500_sharp,
                                                                      size: 20,
                                                                      color: AppColors
                                                                          .kPrimaryLight,
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            5),
                                                                    Text(
                                                                      element
                                                                          .rating!
                                                                          .toString(),
                                                                      style: AppTextStyles.textSize13(
                                                                          context:
                                                                              context,
                                                                          isBold:
                                                                              false),
                                                                    )
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    height: 3),
                                                                SizedBox(
                                                                  width: 100,
                                                                  child: Text(
                                                                    element
                                                                        .author!,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: AppTextStyles.textSize13(
                                                                            context:
                                                                                context,
                                                                            isBold:
                                                                                false)
                                                                        .copyWith(
                                                                            color:
                                                                                Colors.grey),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                        right: 13,
                                                        top: 13,
                                                        child: CircleAvatar(
                                                          radius: 18,
                                                          backgroundColor:
                                                              AppColors.kLigth,
                                                          child: IconButton(
                                                              style: const ButtonStyle(
                                                                  padding: MaterialStatePropertyAll(
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 2))),
                                                              onPressed: () {},
                                                              icon: Icon(
                                                                size: 27,
                                                                Icons
                                                                    .favorite_border_rounded,
                                                                color: AppColors
                                                                    .kPrimaryColor,
                                                              )),
                                                        )),
                                                    Positioned(
                                                      right: 15,
                                                      bottom: 12,
                                                      child: Text(
                                                        '\$ ${element.price}',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: AppTextStyles
                                                                .textSize18(
                                                                    context:
                                                                        context,
                                                                    isBold:
                                                                        true)
                                                            .copyWith(
                                                                color: AppColors
                                                                    .kPrimaryColor,
                                                                fontFamily:
                                                                    AppFonsts
                                                                        .bdBold),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
