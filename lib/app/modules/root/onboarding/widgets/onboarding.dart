import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:storybook/app/config/constants/app_assets.dart';
import 'package:storybook/app/config/constants/app_colors.dart';
import 'package:storybook/app/config/constants/app_fonts.dart';

final List<Widget> pageView = [
  Padding(
    padding: const EdgeInsets.all(20.0),
    child: Center(
      child: pageViewWidget(
        image: AppAssets.onboarding2,
        title: 'Welcome to Storybook',
        width: 400,
        description:
            'Book people are the best kind of people. This is self-evident, really. If the world were run by librarians, we would have a better planet.',
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(20.0),
    child: Center(
      child: pageViewWidget(
        image: AppAssets.onboarding1,
        title: 'Storybook',
        width: 350,
        description:
            'Book people are the best kind of people. This is self-evident, really. If the world were run by librarians, we would have a better planet. We just would. (Actually, check out the documentary Ex Libris for hard evidence of this concept.)',
      ),
    ),
  ),
];

Column pageViewWidget(
    {required String image,
    required String title,
    required String description,
    required double width}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        flex: 10,
        child: SizedBox(
          child: SvgPicture.asset(
            image,
            width: width,
          ),
        ),
      ),
      Expanded(
          flex: 5,
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                    color: AppColors.kLigth,
                    fontSize: 25,
                    fontFamily: AppFonsts.bdBold,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                description,
                style: TextStyle(
                    color: AppColors.kLigth,
                    fontSize: 16,
                    fontFamily: AppFonsts.bdSemiBold,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
    ],
  );
}
