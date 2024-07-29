import 'package:get/get.dart';
import 'package:storybook/app/config/localStore/dataStorage.dart';
import 'package:storybook/app/config/network/apiServiceImp.dart';
import 'package:storybook/app/config/network/apiServiceRepo.dart';
import 'package:storybook/app/config/network/api_points.dart';
import 'package:storybook/app/config/util/WaitingProcess.dart';
import 'package:storybook/app/config/util/dialog_message.dart';
import 'package:storybook/app/modules/root/auth/services/auth_repo.dart';
import 'package:storybook/app/modules/root/auth/services/auth_request_model/auth_request_model.dart';
import 'package:storybook/app/modules/root/auth/services/auth_request_model/register_request_model.dart';
import 'package:storybook/app/modules/root/auth/services/auth_response_model/user_respones_model.dart';

class AuthImp extends AuthRepo {
  late APIServiceRepo apiServiceRepo;

  @override
  AuthImp() {
    apiServiceRepo = Get.put(APIServiceImp());
  }

  @override
  Future<bool> login({required AuthRequest value}) async {
    var result = await apiServiceRepo.postRequest(APIPoint.auth,
        query: value.toJson(), showLoad: false);
    if (result.statusCode == 200) {
      Storage.setToken(result.body['token']);
      await getUserInfo();
      return true;
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        Waiting.hide();
        SnackBarHelper.showSnackBar(
          context: Get.context!,
          snackBarType: SnackBarType.error,
          title: 'Sorry',
          message: 'You have entered incorrect information',
        );
      });
      return false;
    }
  }

  @override
  Future<UserInfoModel> getUserInfo() async {
    var result =
        await apiServiceRepo.getRequest(APIPoint.userInfo, useToken: true);
    if (result.statusCode == 200) {
      Storage.setUserInfo(userInfo: UserInfoModel.fromJson(result.body));
      return UserInfoModel.fromJson(result.body);
    } else {
      return UserInfoModel();
    }
  }

  @override
  Future<bool> register({required RegisterRequestModel value}) async {
    var result = await apiServiceRepo.postRequest(APIPoint.register,
        query: value.toJson(), showLoad: false, useToken: false);
    if (result.statusCode == 200) {
      Future.delayed(const Duration(milliseconds: 200), () {
        Waiting.hide();
        SnackBarHelper.showSnackBar(
          context: Get.context!,
          snackBarType: SnackBarType.success,
          title: 'Success',
          message: 'Register success',
        );
      });
      return true;
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        Waiting.hide();
        SnackBarHelper.showSnackBar(
          context: Get.context!,
          snackBarType: SnackBarType.error,
          title: 'Sorry',
          message: 'You have entered incorrect information',
        );
      });
      return false;
    }
  }
}
