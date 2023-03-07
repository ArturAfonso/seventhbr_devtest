import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seventh_devtest/app/data/shared/themes/themes.dart';

class HomeController extends GetxController {
  GetStorage storage = GetStorage('userPreferences');

  @override
  void changeTheme() {
    if (Get.isDarkMode) {
      storage.write('theme', 'light');
      Get.changeTheme(lightTheme);
      print(storage.read('theme'));
    } else {
      storage.write('theme', 'dark');
      Get.changeTheme(darkTheme);
      print(storage.read('theme'));
    }
  }
}
