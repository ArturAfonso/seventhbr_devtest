import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seventh_devtest/app/data/shared/themes/themes.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init('userPreferences');
  GetStorage storage = GetStorage('userPreferences');
  print(storage.read('theme'));
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: storage.read('theme') == "dark" ? darkTheme : lightTheme,
      darkTheme: darkTheme,
      title: "SeventhBr DevTest",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
