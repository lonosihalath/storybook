import 'package:get/get.dart';

abstract class APIServiceRepo {
  Future<Response> getRequest(String pathAPI,
      {Map<String, dynamic>? query, bool? useToken = true, bool showLoad});

  Future<Response> postRequest(String pathAPI,
      {Map<String, dynamic>? query, bool? useToken = true, bool showLoad});

  Future<Response> putRequest(String pathAPI,
      {Map<String, dynamic>? query, bool? useToken = true, bool showLoad});

  Future<Response> deleteRequest(String pathAPI,
      {Map<String, dynamic>? query, bool? useToken = true, bool showLoad});
}
