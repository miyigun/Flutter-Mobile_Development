import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/controller/consts/colors.dart';
import 'package:music_player/controller/player_controller.dart';
import 'package:music_player/view/music_player_tab.dart';
import 'package:music_player/view/tools_tab.dart';
import 'package:music_player/view/settings_tab.dart';

class PageBase extends StatelessWidget {
  const PageBase({super.key});



  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());

    var listPages=[
      const MusicPlayerTab(),
      const ToolsTab(),
      const SettingsTab()
    ];

    return Scaffold(
        backgroundColor: bgDarkColor,
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                    () => listPages[controller.currentIndex.value],
              )
          ),
        ),
      bottomNavigationBar: Obx(()=>Wrap(
          children: [
            SafeArea(
              child: Container(),
            ),
            BottomNavigationBar(
                currentIndex: controller.currentIndex.value,
                backgroundColor: bgColor,
                selectedItemColor: yellowColor,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.music_note,
                          color: controller.currentIndex.value == 0
                              ? yellowColor
                              : whiteColor),
                      label: 'Müzikler'),
                  BottomNavigationBarItem(
                      icon: Icon(
                          Icons.home_repair_service,
                          color: controller.currentIndex.value == 1
                              ? yellowColor
                              : whiteColor),
                      label: "Araçlar"),

                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings,
                          color: controller.currentIndex.value == 2
                              ? yellowColor
                              : whiteColor),
                      label: 'Ayarlar'),

                ],
                onTap: (selectedIndex) {
                  controller.currentIndex.value = selectedIndex;
                }),
          ]
      )),
      /*else if (snapshot.data!.isEmpty) {
                return Center(
                    child: Text(
                  "Hiç şarkı bulunamadı",

                  //"No song found",
                  style: myStyle(
                    color: yellowColor
                  ),
                ));
              } else {
                return
              }*/

    );
  }
}
