import 'package:flutter_dotenv/flutter_dotenv.dart';

String pathAPI = "/api";
String apiVersions = "/api/${dotenv.env['API_VERSIONS'].toString()}";

class APIPoint {
  static String auth = "$pathAPI/user/login";
  static String register = "$pathAPI/user/register";
  static String userInfo = "$pathAPI/user/getuser_data";
  static String updateUserInfo = "$pathAPI/user/update";
  static String addDelivery = "$pathAPI/user/addDeliveryDetail";
  static String getDelivery = "$pathAPI/user/getdeliveryDetail";
  static String getCategory = "$pathAPI/books/category";
  static String getAllBook = "$pathAPI/books/listbooks";
  static String getOrder = "$pathAPI/orders/getOrders";
  static String orderPayment = "$pathAPI/orders/order-payment";
}
