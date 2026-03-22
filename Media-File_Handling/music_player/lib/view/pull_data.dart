import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/controller/consts/colors.dart';
import 'package:music_player/controller/player_controller.dart';
import 'package:music_player/view/page_base.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PullData extends StatelessWidget {
  const PullData({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());

    return Scaffold(
        backgroundColor: bgDarkColor,
        body: FutureBuilder<List<SongModel>>(
            future: controller.audioQuery.querySongs(
                ignoreCase: true,
                orderType: OrderType.ASC_OR_SMALLER,
                sortType: null,
                //şimdilik emülatörde çalışsın diye böyle "UriType.INTERNAL" yazdım. Uygulama resmileştiğinde "UriType.EXTERNAL" yazacağım
                uriType: UriType.INTERNAL),
            builder: (BuildContext context, snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Veriler yükleniyor...",
                        style: TextStyle(
                          color: yellowColor,
                        ),
                      )
                    ],
                  ),
                );
              } else {

                controller.createDataAllList(snapshot.data!);

                controller.favoriteSelectedList.value=List.generate(snapshot.data!.length, (index) => false);
                //controller.favoriteIdList.value=List.generate(snapshot.data!.length, (index) => '');
                //controller.favoriteSingList.value=List.generate(snapshot.data!.length, (index) => '');
                //controller.favoriteSingerList.value=List.generate(snapshot.data!.length, (index) => '');

               //var model=SingSongModel("","","");

                //for(int i=0;i<snapshot.data!.length;i++) {
                //  controller.favoriteList.add(model);
                //}

                return PageBase();

              }
            }));
  }
}
