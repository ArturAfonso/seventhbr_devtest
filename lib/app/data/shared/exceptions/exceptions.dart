import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Exceptions {
  static SnackbarController normalException(String txt) {
    return Get.snackbar("Erro", txt, colorText: Colors.white, backgroundColor: Colors.red);
  }

  static SnackbarController normalSucess(String txt) {
    return Get.snackbar("Success", txt, colorText: Colors.white, backgroundColor: Colors.green);
  }
}
