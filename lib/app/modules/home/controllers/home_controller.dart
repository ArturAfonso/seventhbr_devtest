import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:seventh_devtest/app/data/models/user_model.dart';
import 'package:video_player/video_player.dart';

import '../../../data/providers/home_provider.dart';
import '../../../data/shared/exceptions/exceptions.dart';

class HomeController extends GetxController {
  HomeProvider provider = HomeProvider();

  VideoPlayerController? videoPlayerController;

  ChewieController? chewieController;

  Rx<Chewie>? playerWidget;
  Rx<CircularProgressIndicator> progress = const CircularProgressIndicator().obs;

  late User userLogged = User();

  @override
  void onClose() {
    super.onClose();
    disposeWidgets();

    super.dispose();
  }

  void disposeWidgets() {
    playerWidget!.close();
    videoPlayerController!.dispose();
    chewieController!.dispose();
    debugPrint('disposed');
  }

  Future<Rx<Chewie>?> getVideo() async {
    try {
      if (userLogged.token != null) {
        var response = await provider.getVideo(userLogged.token.toString(), "bunny.mp4");
        if (response != null) {
          if (response.statusCode == 200) {
            videoPlayerController = VideoPlayerController.network(response.body['url']);

            await videoPlayerController!.initialize();
            chewieController = ChewieController(
              videoPlayerController: videoPlayerController!,
              autoPlay: true,
              showControls: true,
            );
            playerWidget = Chewie(
              controller: chewieController!,
            ).obs;

            return playerWidget;
          }
        }
      }
    } catch (e) {
      Exceptions.normalException(e.toString());
    }
    return null;
  }
}
