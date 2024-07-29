import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:storybook/app/config/localStore/dataStorage.dart';
import 'package:storybook/app/config/network/apiEndpoint.dart';
import 'package:storybook/app/config/network/apiServiceRepo.dart';

class APIServiceImp extends GetConnect implements APIServiceRepo {
  final headers = {'Accept': "application/json"};
  final defaultContentType = 'application/json; charset=UTF-8';

  @override
  Future<void> onInit() async {
    httpClient.baseUrl = APIEndpoint.baseUrl;
    httpClient.timeout = const Duration(seconds: 10);
    httpClient.errorSafety = true;
    super.onInit();
  }

  @override
  Future<Response> getRequest(String pathAPI,
      {Map<String, dynamic>? query,
      bool? useToken = true,
      bool showLoad = true}) async {
    if (useToken == true) {
      String? token = Storage.getToken;
      if (token != null) {
        headers.addAll({'Authorization': 'Bearer $token'});
        // debugPrint("token : $token");
      }
    }

    try {
      final response = await get(
        pathAPI,
        contentType: defaultContentType,
        headers: headers,
        query: query,
      );
      log(response.statusCode.toString());
      return Result.resulData(
          response: response, showLoad: showLoad, apiPath: pathAPI.toString());
    } on FormatException {
      return Response(body: 'Bad Response Format!'.tr, statusCode: 400);
    } on Error catch (e) {
      return Response(body: e.toString(), statusCode: 400);
    } catch (exception) {
      return Response(body: exception, statusCode: 400);
    }
  }

  @override
  Future<Response> postRequest(String pathAPI,
      {Map<String, dynamic>? query,
      bool? useToken = true,
      bool showLoad = true}) async {
    if (useToken == true) {
      String? token = Storage.getToken;
      if (token != null) {
        headers.addAll({'Authorization': 'Bearer $token'});
      }
    }

    // debugPrint("send : ${httpClient.baseUrl}");
    try {
      final response = await post(
        pathAPI,
        jsonEncode(query),
        contentType: defaultContentType,
        headers: headers,
      );
      log(response.statusCode.toString());
      return Result.resulData(response: response, showLoad: showLoad);
    } on FormatException {
      return Response(body: 'Bad Response Format!'.tr, statusCode: 400);
    } on Error catch (e) {
      return Response(body: e.toString(), statusCode: 400);
    } catch (exception) {
      return Response(
        body: exception,
        statusCode: 400,
      );
    }
  }

  @override
  Future<Response> putRequest(String pathAPI,
      {Map<String, dynamic>? query,
      bool? useToken = true,
      bool showLoad = true}) async {
    String? token = Storage.getToken;
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    try {
      final response = await put(
        pathAPI,
        jsonEncode(query),
        headers: headers,
      );
      log(response.statusCode.toString());
      return Result.resulData(response: response, showLoad: showLoad);
    } on FormatException {
      return Response(body: 'Bad Response Format!'.tr, statusCode: 400);
    } on Error catch (e) {
      return Response(body: e.toString(), statusCode: 400);
    } catch (exception) {
      // debugPrint(exception.toString());
      return Response(body: exception, statusCode: 400);
    }
  }

  @override
  Future<Response> deleteRequest(String pathAPI,
      {Map<String, dynamic>? query,
      bool? useToken = true,
      bool showLoad = true}) async {
    String? token = Storage.getToken;
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      final response = await delete(
        pathAPI,
        headers: headers,
      );
      log(response.statusCode.toString());
      return Result.resulData(response: response, showLoad: showLoad);
    } on FormatException {
      return Response(body: 'Bad Response Format!'.tr, statusCode: 400);
    } on Error catch (e) {
      return Response(body: e.toString(), statusCode: 400);
    } catch (exception) {
      //  showLoad == true ? Waiting.getHide() : null;
      ///debugPrint(exception.toString());
      return Response(body: exception, statusCode: 400);
    }
  }
}

class Result {
  static Response resulData(
      {required Response response, bool showLoad = true, apiPath}) {
    if (response.statusCode == null || response.statusCode == 404) {
      //showLoad == true ? Waiting.getHide() : null;
      // // Internal Server Error
      return Response(
          body: 'Bad Response Format!'.tr, statusCode: response.statusCode);
    }
    if (response.statusCode == 200) {
      //showLoad == true ? Waiting.getHide() : null;
    }
    if (response.statusCode == 401) {}
    if (response.statusCode == 422) {}
    if (response.statusCode == 400) {}

    if (response.statusCode == 500) {}
    return response;
  }
}
