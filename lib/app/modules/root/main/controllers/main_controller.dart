import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:storybook/app/modules/root/main/controllers/delivery_controller/delivery_controller.dart';
import 'package:storybook/app/modules/root/main/controllers/home_controller/home_controller.dart';
import 'package:storybook/app/modules/root/main/controllers/shopping_cart_controller/shopping_cart_controller.dart';
import 'package:storybook/app/modules/root/main/pages/home_page.dart';
import 'package:storybook/app/modules/root/main/pages/search_page.dart';
import 'package:storybook/app/modules/root/main/pages/setting.dart';
import 'package:storybook/app/modules/root/main/pages/shopping_cart.dart';
import 'package:storybook/app/modules/root/main/pages/wishlist.dart';

class MainController extends GetxController {
  @override
  MainController() {
    Get.put(HomeController());
    Get.put(ShoppingCartController());
    Get.put(DeliveryController());
  }

  final count = 0.obs;
  late RxInt currentIndex = 0.obs;

  page() {
    switch (currentIndex.value) {
      case 0:
        return const SizedBox(child: HomePage());
      case 1:
        return const SizedBox(child: SearchPageView());
      case 2:
        return const SizedBox(child: WishListView());
      case 3:
        return const SizedBox(child: SettingView());
      case 4:
        return const SizedBox(child: ShoppingCartView());
      default:
        return const SizedBox(child: HomePage());
    }
  }

  void selectBottomBar(int index) {
    currentIndex.value = index;
    update();
  }
}

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
}
