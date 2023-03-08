import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared/constants.dart';

class HomeProvider extends GetConnect {
  Future<Response<dynamic>?> getVideo(String token, String fileName) async {
    var url = '$urlBase/video/$fileName';

    final headers = {'accept': 'application/json', 'Content-Type': 'application/json', 'x-access-Token': token};

    var response = await get(url, headers: headers);
    debugPrint(response.toString());
    return response;
  }
}
