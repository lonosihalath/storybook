import 'package:storybook/app/config/localStore/dataStorage.dart';

class AppFonsts {
  static String bdBlack = 'BD-Black';
  static String bdBold = 'BD-Bold';
  static String bdMedium = 'BD-Medium';
  static String bdSemiBold = 'BD-SemiBold';
  static String noto = 'Noto';
}

String appFontFamily() {
  if (Storage.getLocale == 'lo') {
    return 'Noto';
  } else {
    return 'BD-SemiBold';
  }
}
