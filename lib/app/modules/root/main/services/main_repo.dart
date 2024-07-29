import 'package:storybook/app/modules/root/main/services/request_models/add_delivery_request.dart';
import 'package:storybook/app/modules/root/main/services/response_models/category_model.dart';
import 'package:storybook/app/modules/root/main/services/response_models/deliverry_response_model.dart';
import 'package:storybook/app/modules/root/main/services/response_models/list_books_model.dart';

abstract class MainRepo {
  Future<List<CategoryModel>> getCetegory();
  Future<List<ListBooksModel>> getListBooks();
  Future<bool> addDelivery({required AddDeliveryRequest bodyRequest});
  Future<GetDeliveryResponse?> getDelivery();
}
