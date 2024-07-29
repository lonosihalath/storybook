import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:storybook/app/config/util/WaitingProcess.dart';
import 'package:storybook/app/config/util/dialog_message.dart';
import 'package:storybook/app/modules/root/auth/services/auth_imp.dart';
import 'package:storybook/app/modules/root/auth/services/auth_repo.dart';
import 'package:storybook/app/modules/root/auth/services/auth_request_model/auth_request_model.dart';
import 'package:storybook/app/modules/root/auth/services/auth_request_model/register_request_model.dart';
import 'package:storybook/app/routes/app_pages.dart';

class AuthController extends GetxController {
  late AuthRepo authRepo;

  @override
  AuthController() {
    authRepo = Get.put(AuthImp());
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController emailRegister = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController passwordRegister = TextEditingController();
  TextEditingController cfPasswordRegister = TextEditingController();

  void login() async {
    Waiting.show();
    var result = await authRepo.login(
      value: AuthRequest(
        email: email.text.trim(),
        password: password.text.trim(),
      ),
    );
    if (result == true) {
      Waiting.hide();
      Get.offAllNamed(Routes.MAIN);
      SnackBarHelper.showSnackBar(
        context: Get.context!,
        snackBarType: SnackBarType.success,
        title: 'Login Successful',
        message: 'Welcome to Storybook',
      );
    }
  }

  DateTime selectedDate = DateTime.now();

  Future<void> selectDate({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color(0xFF00ACE6),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: selectedDate,
        fieldHintText: 'yyyy/MM/dd',
        useRootNavigator: false,
        keyboardType: TextInputType.datetime,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2000),
        lastDate: DateTime.now());

    if (picked != null) {
      selectedDate = picked;
      var dateString = DateFormat('yyyy/MM/dd').format(selectedDate);
      date.text = dateString;
      update();
    }
  }

  void register() async {
    Waiting.show();
    var jsonData = RegisterRequestModel(
      firstName: name.text,
      lastName: "",
      dob: date.text,
      userName: "",
      email: emailRegister.text,
      password: passwordRegister.text,
    );
    var result = await authRepo.register(value: jsonData);
    if (result == true) {
      Waiting.hide();
      Get.back();
    }
  }

  final count = 0.obs;
  late RxBool obscureText = true.obs;
  late RxBool obscureTextRegister = true.obs;
  late RxBool obscureTextcfRegister = true.obs;

  void setObscureText() {
    obscureText.value = !obscureText.value;
    update();
  }

  void setObscureTextPasswordRegister({required String type}) {
    if (type != 'confirm') {
      obscureTextRegister.value = !obscureTextRegister.value;
    } else {
      obscureTextcfRegister.value = !obscureTextcfRegister.value;
    }
    update();
  }

  void increment() => count.value++;
}
