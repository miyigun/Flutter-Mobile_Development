import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/controller/consts/text_style.dart';
import 'package:music_player/view/pull_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      theme: ThemeData(
        fontFamily: regular,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const PullData()
    );
  }

}


