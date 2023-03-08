import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //controller.getVideo();
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.userLogged.username ?? 'não autenticado'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: controller.getVideo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // candidato-seventh
                // 8n5zSrYq
                return Center(
                    child: Container(
                        color: Get.isDarkMode ? null : Colors.black45,
                        width: Get.size.width,
                        height: Get.size.height / 2,
                        child: controller.playerWidget!.value));
              } else {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
