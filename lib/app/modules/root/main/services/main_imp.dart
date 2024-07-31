import 'dart:developer';

import 'package:get/get.dart';
import 'package:storybook/app/config/network/apiServiceImp.dart';
import 'package:storybook/app/config/network/apiServiceRepo.dart';
import 'package:storybook/app/config/network/api_points.dart';
import 'package:storybook/app/modules/root/main/services/main_repo.dart';
import 'package:storybook/app/modules/root/main/services/request_models/add_delivery_request.dart';
import 'package:storybook/app/modules/root/main/services/response_models/category_model.dart';
import 'package:storybook/app/modules/root/main/services/response_models/deliverry_response_model.dart';
import 'package:storybook/app/modules/root/main/services/response_models/list_books_model.dart';

class MainImp extends MainRepo {
  late APIServiceRepo apiServiceRepo;

  @override
  MainImp() {
    apiServiceRepo = Get.put(APIServiceImp());
  }

  @override
  Future<List<CategoryModel>> getCetegory() async {
    List<CategoryModel>? data = [];
    var response = await apiServiceRepo.getRequest(APIPoint.getCategory);
    if (response.statusCode == 200) {
      response.body.forEach((v) {
        data.add(CategoryModel.fromJson(v));
      });
      return data;
    } else {
      return data;
    }
  }

  @override
  Future<List<ListBooksModel>> getListBooks() async {
    List<ListBooksModel>? data = [];
    var response = await apiServiceRepo.getRequest(APIPoint.getAllBook);
    if (response.statusCode == 200) {
      response.body.forEach((v) {
        data.add(ListBooksModel.fromJson(v));
      });
      return data;
    } else {
      return data;
    }
  }

  @override
  Future<bool> addDelivery({required AddDeliveryRequest bodyRequest}) async {
    log('Delivery request::: ${bodyRequest.toJson()}');
    var response = await apiServiceRepo.postRequest(APIPoint.addDelivery,
        useToken: true, query: bodyRequest.toJson());
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<GetDeliveryResponse?> getDelivery() async {
    var response =
        await apiServiceRepo.getRequest(APIPoint.getDelivery, useToken: true);
    if (response.statusCode == 200) {
      return GetDeliveryResponse.fromJson(response.body);
    } else {
      return null;
    }
  }

}
