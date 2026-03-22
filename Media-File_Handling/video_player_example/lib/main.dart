import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_example/view/video_player_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: "Video Player",
      debugShowCheckedModeBanner: false,
      home: VideoPlayerWidget(),
    );
  }
}



