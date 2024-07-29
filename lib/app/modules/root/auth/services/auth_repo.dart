import 'package:storybook/app/modules/root/auth/services/auth_request_model/auth_request_model.dart';
import 'package:storybook/app/modules/root/auth/services/auth_request_model/register_request_model.dart';
import 'package:storybook/app/modules/root/auth/services/auth_response_model/user_respones_model.dart';

abstract class AuthRepo {
  Future<bool> login({required AuthRequest value});
  Future<bool> register({required RegisterRequestModel value});
  Future<UserInfoModel> getUserInfo();
}
