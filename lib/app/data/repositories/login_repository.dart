import 'package:flutter/material.dart';
import 'package:seventh_devtest/app/data/models/user_model.dart';
import 'package:seventh_devtest/app/data/providers/login_provider.dart';

class LoginRepository {
  final LoginProvider provider = LoginProvider();

  Future<User?> login(String username, String password) async {
    Map<String, dynamic>? json = await provider.login(username, password);
    if (json != null) {
      json['username'] = username;

      debugPrint(json.toString());

      return User.fromJson(json);
    }
    return null;
  }
}
