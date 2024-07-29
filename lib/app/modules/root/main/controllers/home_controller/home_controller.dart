import 'dart:developer';

import 'package:get/get.dart';
import 'package:storybook/app/config/localStore/dataStorage.dart';
import 'package:storybook/app/modules/root/main/services/main_imp.dart';
import 'package:storybook/app/modules/root/main/services/main_repo.dart';
import 'package:storybook/app/modules/root/main/services/response_models/category_model.dart';
import 'package:storybook/app/modules/root/main/services/response_models/list_books_model.dart';

class HomeController extends GetxController {
  late MainRepo mainRepo;

  @override
  HomeController() {
    mainRepo = Get.put(MainImp());
  }

  late RxInt currentIndexImage = 0.obs;
  final List<String> images = [
    'https://images.gr-assets.com/misc/1687390558-1687390558_goodreads_misc.png',
    'https://images.gr-assets.com/misc/1687390558-1687390558_goodreads_misc.png',
    'https://images.gr-assets.com/misc/1687390558-1687390558_goodreads_misc.png',
  ];

  late RxList<CategoryModel> categoryData = <CategoryModel>[].obs;
  late RxList<ListBooksModel> listBooksData = <ListBooksModel>[].obs;
  late Rx<CategoryModel> selectCategoryData = CategoryModel().obs;

  void getCategory() async {
    var result = await mainRepo.getCetegory();
    if (result.isNotEmpty) {
      selectCategoryData.value = result.first;
      Storage.setCategoryInfo(categoryModel: result);
    }
    update();
  }

  void getListBooks() async {
    var result = await mainRepo.getListBooks();
    if (result.isNotEmpty) {
      listBooksData.value = result;
      Storage.setListBooksInfo(listBooks: result);
    }
    update();
  }

  void selectCategory({required CategoryModel value}) {
    selectCategoryData.value = value;
    update();
  }

  @override
  void onInit() {
    getCategory();
    getListBooks();
    super.onInit();
  }
}
