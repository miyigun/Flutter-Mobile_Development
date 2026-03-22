import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_example/controller/controller.dart';

class PlayVideoScreen extends StatelessWidget {
  const PlayVideoScreen({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {

    Controller controller = Get.find();

    controller.videoPlayerController.value.play();
    controller.videoPlayerController.value.setLooping(true);

    return Scaffold(
      appBar: AppBar(
        title: Text("Video ${index + 1}"),
      ),
      body: AspectRatio(
        aspectRatio: 4 / 3,
        child: VideoPlayer(controller.videoPlayerController.value),
      ),
    );
  }
}
