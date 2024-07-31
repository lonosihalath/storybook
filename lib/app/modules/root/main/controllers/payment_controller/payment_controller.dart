import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:storybook/app/config/constants/app_colors.dart';
import 'package:storybook/app/config/constants/app_fonts.dart';
import 'package:storybook/app/config/util/WaitingProcess.dart';
import 'package:storybook/app/modules/root/main/controllers/delivery_controller/delivery_controller.dart';
import 'package:storybook/app/modules/root/main/controllers/shopping_cart_controller/shopping_cart_controller.dart';
import 'package:storybook/app/modules/root/main/services/main_imp.dart';
import 'package:storybook/app/modules/root/main/services/main_repo.dart';
import 'package:storybook/app/routes/app_pages.dart';

class PaymentController extends GetxController {
  final cartController = Get.find<ShoppingCartController>();
  final deliveryController = Get.find<DeliveryController>();
  late MainRepo mainRepo;
  PaymentController() {
    mainRepo = Get.put(MainImp());
  }

  XFile? paymentUpload;

  void uploadPayment() async {
    var imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      paymentUpload = imageFile;
    }
    update();
  }

  void confirmPayment() async {
    if (paymentUpload != null) {
      Waiting.show();
      Future.delayed(const Duration(seconds: 2), () {
        Waiting.hide();
        showLogSuccess();
      });
    } else {
      showLogHandledImage();
    }
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
                  'Order success',
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
      Get.offAllNamed(Routes.MAIN);
      Get.snackbar(
        'Order success',
        'Your order has been successfully placed',
        icon: const Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.green,
          size: 40,
        ),
        duration: const Duration(seconds: 5),
      );
    });
  }

  void showLogHandledImage() {
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
                Text(
                  'Please select image',
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
