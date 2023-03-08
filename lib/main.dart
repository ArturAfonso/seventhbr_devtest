import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:seventh_devtest/app/data/shared/themes/themes.dart';

import 'app/modules/home/controllers/home_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  Get.put(HomeController());

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
      title: "SeventhBr DevTest",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
