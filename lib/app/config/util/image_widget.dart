import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:storybook/app/config/constants/app_colors.dart';

Widget imageWidget({required String url}) {
  return url.isEmpty
      ? Center(
          child: Icon(
            Icons.photo_library_rounded,
            color: AppColors.kPrimaryColor,
            size: 30,
          ),
        )
      : CachedNetworkImage(
          imageUrl: url,
          imageBuilder: (context, imageProvider) => GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          placeholder: (context, url) => SpinKitCircle(
            color: AppColors.kPrimaryColor,
            size: 50.0,
          ),
          errorWidget: (context, url, error) => Center(
            child: Icon(
              Icons.photo_library_rounded,
              color: AppColors.kPrimaryColor,
              size: 35,
            ),
          ),
        );
}
