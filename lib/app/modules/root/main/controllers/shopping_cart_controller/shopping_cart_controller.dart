import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storybook/app/config/constants/app_colors.dart';
import 'package:storybook/app/config/constants/app_fonts.dart';
import 'package:storybook/app/config/util/WaitingProcess.dart';
import 'package:storybook/app/modules/root/main/services/response_models/list_books_model.dart';

class ShoppingCartController extends GetxController {
  late ListBooksModel data = Get.arguments['book'];
  late RxList<ListBooksModel> addCart = <ListBooksModel>[].obs;

  void setData() {
    data = Get.arguments['book'];
    Future.delayed(Duration.zero, () => update());
  }

  void addCartData() {
    if (addCart.isEmpty) {
      addCart.add(data);
    } else {
      if (!addCart.any((element) => element.bookId == data.bookId)) {
        addCart.add(data);
      }
    }
    showLogSuccess();
    update();
  }

  String getPrice() {
    double price = 0;
    for(var element in addCart) {
      price += element.price!;
    }
    return price.toString();
  }

  void removeCartData({required ListBooksModel dataList}) {
    addCart.removeWhere((element) => element.bookId == dataList.bookId);
    update();
  }

  void showLogSuccess() {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.transparent,
      contentPadding: const EdgeInsetsDirectional.all(0),
      content: Container(
          width: 300,
          height: 130,
          decoration: BoxDecoration(
              color: AppColors.kLigth, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline_rounded,
                  color: AppColors.kPrimaryColor,
                  size: 50,
                ),
                const SizedBox(height: 10),
                Text(
                  'Add to cart success',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: appFontFamily(),
                      color: Colors.grey.shade700),
                )
              ],
            ),
          )),
    ));
    Future.delayed(const Duration(milliseconds: 1100), () {
      Waiting.hide();
    });
  }
}
