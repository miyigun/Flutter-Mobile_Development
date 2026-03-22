import 'package:flutter/material.dart';
import 'package:music_player/controller/consts/colors.dart';
import 'package:music_player/controller/consts/text_style.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDarkColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 100),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: bgColor,
              leading: const Icon(Icons.language, color: whiteColor, size: 30),
              title: Text("Dili Değiştir",
                style: myStyle(family: bold, color: yellowColor, size: 24),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: bgColor,
              leading: const Icon(Icons.color_lens_sharp, color: Colors.white, size: 30),
              title: Text("Temayı Değiştir",
                style: myStyle(family: bold, color: yellowColor, size: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }

}