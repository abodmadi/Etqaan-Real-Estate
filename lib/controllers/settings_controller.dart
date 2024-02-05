import 'package:get/get.dart';

class SettingsController extends GetxController {
  SettingsController();
  //Locale _locale = Locale('ar', '');

  String _language = 'ar';
  String get appLanguage => _language;

  changeAppLanguage(String language) {
    _language = language;
    update();
  }
}
