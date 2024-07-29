import 'package:get/get.dart';
import 'package:storybook/app/modules/root/main/services/response_models/list_books_model.dart';

class ShoppingCartController extends GetxController {
  late ListBooksModel data = Get.arguments['book'];

  void setData() {
    data = Get.arguments['book'];
    update();
  }
}
