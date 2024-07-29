import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:storybook/app/config/appTranslations/app_translations.dart';
import 'package:storybook/app/config/constants/app_colors.dart';
import 'package:storybook/app/modules/root/bindings/root_binding.dart';
import 'package:storybook/app/modules/root/main/controllers/main_controller.dart';
import 'package:storybook/app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "env/.main.env");
  await GetStorage.init();
  //boxStorage.remove('token');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Get.put<MyDrawerController>(MyDrawerController());
  runApp(const MyApp());
}

class MyApp extends GetMaterialApp {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
            color: AppColors.kPrimaryColor,
            iconTheme: IconThemeData(color: AppColors.kLigth)),
      ),
      initialBinding: RootBinding(),
      getPages: AppPages.routes,
      translations: AppTranslations(),
      debugShowCheckedModeBanner: false,
      checkerboardRasterCacheImages: false,
      checkerboardOffscreenLayers: false,
      title: 'Strorybook',
      useInheritedMediaQuery: true,
    );
  }
}
