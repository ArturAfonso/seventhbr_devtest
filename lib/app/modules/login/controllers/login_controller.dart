import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seventh_devtest/app/data/repositories/login_repository.dart';
import 'package:seventh_devtest/app/routes/app_pages.dart';

import '../../home/controllers/home_controller.dart';

class LoginController extends GetxController {
  HomeController cHome = Get.find();
  LoginRepository repository = LoginRepository();

  final String assetName = 'assets/seventh_logo.svg';

  final loginformKey = GlobalKey<FormState>();
  TextEditingController controllerLogin = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  void login() async {
    if (loginformKey.currentState!.validate()) {
      var response = await repository.login(controllerLogin.text, controllerPassword.text);

      if (response != null) {
        if (response.token != null) {
          cHome.userLogged.username = response.username;
          cHome.userLogged.token = response.token;
          Get.offAndToNamed(Routes.HOME);
        }
      } else {}
    }
  }
}
