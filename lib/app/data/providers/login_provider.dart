import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared/constants.dart';
import '../shared/exceptions/exceptions.dart';

class LoginProvider extends GetConnect {
  Future<Map<String, dynamic>?> login(String login, String password) async {
    try {
      const url = '$urlBase/login';
      final body = {"username": login, "password": password};

      var response = await post(url, body);
      debugPrint(response.body.runtimeType.toString());
      if (response.statusCode == 200) {
        return response.body;
      } else {
        Exceptions.normalException(response.statusText.toString());
        throw response.statusCode.toString();
      }
    } catch (e) {
      return null;
    }
  }
}
