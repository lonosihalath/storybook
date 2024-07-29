import 'package:get/get.dart';
import 'package:storybook/app/routes/app_pages.dart';
import '../../../config/localStore/dataStorage.dart';

class RootController extends GetxController {
  void checkAuth() {
    Future.delayed(const Duration(seconds: 3), () {
      if (Storage.getToken == null) {
        if (Storage.getOnboarding == true) {
          Get.offAllNamed(Routes.AUTH);
        } else {
          Get.offAllNamed(Routes.ONBOARDING);
        }
      } else {
        Get.offAllNamed(Routes.MAIN);
      }
    });
  }

  @override
  void onInit() {
    // boxStorage.remove('token');
    Storage.setLocale('en');
    checkAuth();
    super.onInit();
  }
}
