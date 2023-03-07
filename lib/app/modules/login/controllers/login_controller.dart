import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final screenWidith = Get.size.width;
  final screenHeight = Get.size.height;
  double percentWidith(double percent) => screenWidith * percent;
  double percentHeight(double percent) => screenHeight * percent;

  final String assetName = 'assets/seventh_logo.svg';

  final loginformKey = GlobalKey<FormState>();
  TextEditingController controllerLogin = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
}
