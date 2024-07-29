import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storybook/app/config/appTranslations/app_translations.dart';
import 'package:storybook/app/config/constants/app_colors.dart';
import 'package:storybook/app/config/constants/app_fonts.dart';
import 'package:storybook/app/config/localStore/dataStorage.dart';
import 'package:storybook/app/modules/root/onboarding/widgets/onboarding.dart';
import 'package:storybook/app/routes/app_pages.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColors.kPrimaryColor,
              appBar: AppBar(
                backgroundColor: AppColors.kPrimaryColor,
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: languageList
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Storage.setLocale(e.code!);
                                  Get.forceAppUpdate();
                                },
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppColors.kLigth,
                                  child: Image.asset(e.flag!),
                                ),
                              ),
                              const SizedBox(height: 7),
                              Container(
                                width: 25,
                                height: 8,
                                decoration: BoxDecoration(
                                    color: e.code == Storage.getLocale
                                        ? AppColors.kLigth
                                        : AppColors.kPrimaryColor,
                                    borderRadius:
                                        BorderRadius.circular(context.width)),
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              body: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                onPageChanged: (value) {
                  controller.setCurrentPage(value: value);
                },
                children: pageView,
              ),
              bottomNavigationBar: Container(
                padding: const EdgeInsets.all(15),
                width: context.width,
                height: 150,
                decoration: BoxDecoration(color: AppColors.kPrimaryColor),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          pageView.length,
                          (index) => Container(
                                margin: const EdgeInsets.only(right: 7),
                                width:
                                    index == controller.currentPageIndex.value
                                        ? 25
                                        : 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: AppColors.kLigth,
                                    borderRadius:
                                        BorderRadius.circular(context.width)),
                              )),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                if (controller.currentPageIndex.value != 0) {
                                  controller.backPage();
                                } else {
                                  Get.offAllNamed(Routes.AUTH);
                                }
                              },
                              child: Text(
                                controller.currentPageIndex.value == 0
                                    ? 'Skip'
                                    : "Back",
                                style: TextStyle(
                                    color: AppColors.kLigth,
                                    fontFamily: AppFonsts.bdBold,
                                    fontSize: 17),
                              )),
                          TextButton(
                              onPressed: () {
                                if (controller.currentPageIndex.value !=
                                    pageView.length - 1) {
                                  controller.nextPage();
                                } else {
                                  Get.offAllNamed(Routes.AUTH);
                                }
                              },
                              child: Text(
                                controller.currentPageIndex.value !=
                                        pageView.length - 1
                                    ? 'Next'
                                    : 'Continue',
                                style: TextStyle(
                                    color: AppColors.kLigth,
                                    fontFamily: AppFonsts.bdBold,
                                    fontSize: 17),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
