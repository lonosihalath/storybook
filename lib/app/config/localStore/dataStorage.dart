import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:storybook/app/modules/root/auth/services/auth_response_model/user_respones_model.dart';
import 'package:storybook/app/modules/root/main/services/response_models/category_model.dart';
import 'package:storybook/app/modules/root/main/services/response_models/list_books_model.dart';
import 'storageKey.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

final boxStorage = GetStorage();

class Storage {
  Storage._();

  static setBaseURL(String value) => boxStorage.write(StoreKey.baseURL, value);

  static String? get getBaseURL => boxStorage.read(StoreKey.baseURL);

  static String? get getToken => boxStorage.read(StoreKey.token);

  static String? get getReFreshToken => boxStorage.read(StoreKey.refreshToken);

  static Future<void> setToken(String value) =>
      boxStorage.write(StoreKey.token, value);
  static Future removeToken() => boxStorage.remove(StoreKey.token);
  static Future removeRefreshToken() =>
      boxStorage.remove(StoreKey.refreshToken);

  static String? get getLocale => boxStorage.hasData(StoreKey.locale) == true
      ? boxStorage.read(StoreKey.locale)
      : 'en';

  static Set<Future<void>> setLocale(String value) => {
        boxStorage.write(StoreKey.locale, value),
        Get.updateLocale(Locale(getLocale.toString())),
      };

  static Future<void> setReFreshToken(String value) =>
      boxStorage.write(StoreKey.refreshToken, value);

  static setOnboarding(bool value) =>
      boxStorage.write(StoreKey.onboarding, value);
  static bool? get getOnboarding => boxStorage.read(StoreKey.onboarding);

  static setUserInfo({required UserInfoModel userInfo}) =>
      boxStorage.write(StoreKey.userInfo, jsonEncode(userInfo));

  static UserInfoModel get getUserInfo =>
      boxStorage.hasData(StoreKey.userInfo) == true
          ? UserInfoModel.fromJson(
              json.decode(boxStorage.read(StoreKey.userInfo).toString()))
          : UserInfoModel();

  static setCategoryInfo({required List<CategoryModel> categoryModel}) =>
      boxStorage.write(StoreKey.categoryInfo, jsonEncode(categoryModel));

  static List<CategoryModel> get getCategoryInfo {
    if (boxStorage.hasData(StoreKey.categoryInfo)) {
      var data = boxStorage.read(StoreKey.categoryInfo);
      var decodedData = jsonDecode(data);
      if (decodedData is List) {
        return decodedData.map((item) => CategoryModel.fromJson(item)).toList();
      } else {
        throw Exception('Unexpected data format: expected a List');
      }
    } else {
      return [];
    }
  }

  static setListBooksInfo({required List<ListBooksModel> listBooks}) =>
      boxStorage.write(StoreKey.listBooksInfo, jsonEncode(listBooks));

  static List<ListBooksModel> get getListBooksInfo {
    if (boxStorage.hasData(StoreKey.listBooksInfo)) {
      var data = boxStorage.read(StoreKey.listBooksInfo);
      var decodedData = jsonDecode(data);
      if (decodedData is List) {
        return decodedData
            .map((item) => ListBooksModel.fromJson(item))
            .toList();
      } else {
        throw Exception('Unexpected data format: expected a List');
      }
    } else {
      return [];
    }
  }
}
