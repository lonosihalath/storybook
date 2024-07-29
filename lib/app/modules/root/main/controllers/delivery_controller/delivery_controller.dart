import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storybook/app/config/util/WaitingProcess.dart';
import 'package:storybook/app/modules/root/main/services/main_imp.dart';
import 'package:storybook/app/modules/root/main/services/main_repo.dart';
import 'package:storybook/app/modules/root/main/services/request_models/add_delivery_request.dart';
import 'package:storybook/app/modules/root/main/services/response_models/deliverry_response_model.dart';

class DeliveryController extends GetxController {
  late MainRepo mainRepo;

  DeliveryController() {
    mainRepo = Get.put(MainImp());
  }

  TextEditingController villageController = TextEditingController();
  TextEditingController disterictController = TextEditingController();
  TextEditingController provinController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late Rx<GetDeliveryResponse> listDelivery = GetDeliveryResponse().obs;
  late Rx<DeliveryDetail?> selectDelivery = DeliveryDetail().obs;
  late RxBool isLoading = false.obs;

  void addDelivery() async {
    try {
      if (formKey.currentState!.validate()) {
        isLoading.value = true;
        Waiting.show();
        var result = await mainRepo.addDelivery(
            bodyRequest: AddDeliveryRequest(
                delVillage: villageController.text,
                delDistrict: disterictController.text,
                delProvince: provinController.text,
                delPhone: phoneController.text));
        if (result) {
          closePage();
          villageController.clear();
          disterictController.clear();
          provinController.clear();
          phoneController.clear();
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
      update();
    }
  }

  void getDelivery() async {
    try {
      isLoading.value = true;
      var result = await mainRepo.getDelivery();
      if (result != null) {
        listDelivery.value = result;
        selectDelivery.value = listDelivery.value.deliveryDetail!.first;
        log(listDelivery.value.toJson().toString());
      } else {
        selectDelivery.value = null;
        listDelivery.value = GetDeliveryResponse(deliveryDetail: []);
      }
    } catch (e) {
      Get.snackbar('Sorry', 'No Delivery Found');
    } finally {
      Future.delayed(const Duration(seconds: 1), () {
        isLoading.value = false;
        update();
      });
    }
  }

  void selectDeliveryItem({required DeliveryDetail value}) {
    selectDelivery.value = value;
    update();
  }

  @override
  void onInit() {
    log('Hello::: DeliveryController');
    super.onInit();
  }

  void closePage() {
    getDelivery();
    List.generate(2, (index) => Get.back());
  }
}
