import 'package:get/get.dart';
import 'package:storybook/app/config/constants/app_assets.dart';

List<LangeuageModel> languageList = [
  LangeuageModel(id: 1, name: 'Lao', flag: AppAssets.flagLo, code: 'lo'),
  LangeuageModel(id: 2, name: 'English', flag: AppAssets.flagEn, code: 'en'),
];

class LangeuageModel {
  int? id;
  String? name;
  String? flag;
  String? code;
  LangeuageModel({this.id, this.name, this.flag, this.code});
}

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "lo": {
          "Welcome to": "ຍິນດີຕ້ອນຮັບສູ່",
        },
        'en_US': {
          "Welcome to": "Welcome to",
        },
      };
}
