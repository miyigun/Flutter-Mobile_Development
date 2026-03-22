import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/controller/consts/colors.dart';
import 'package:music_player/controller/consts/text_style.dart';
import 'package:music_player/controller/player_controller.dart';
import 'package:music_player/view/player.dart';
import 'package:on_audio_query/on_audio_query.dart';

class FavoriteSingScreen extends StatelessWidget {
  const FavoriteSingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PlayerController controller = Get.find();

    var favoriteIdList=[];
    var favoriteSingList=[];
    var favoriteSingerList=[];

    //Favori şarkı ve şarkıcı listesinde boş olmayan indeksler ayrı bir listeye alınıyor
    for (int i=0;i<controller.favoriteList.length;i++){
      if (controller.favoriteList[i].id!=0){
        favoriteIdList.add(controller.favoriteList[i].id);
        favoriteSingList.add(controller.favoriteList[i].sing);
        favoriteSingerList.add(controller.favoriteList[i].singer);
      }
    }

    return Scaffold(
        backgroundColor: bgDarkColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          //leading: const Icon(Icons.menu, color: yellowColor),
          title: Text(
            "Beğendiğim Şarkılar",
            style: myStyle(
              family: regular2,
              color: yellowColor,
              size: 24,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: controller.favoriteList.length,
            itemBuilder: (BuildContext context, int index){
              return Container(
                margin: const EdgeInsets.only(bottom: 4),
                child:
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        tileColor: bgColor,
                        leading: QueryArtworkWidget(
                          id: controller.favoriteList[index].id!,
                          type: ArtworkType.AUDIO,
                          nullArtworkWidget: const Icon(
                            Icons.music_note,
                            color: yellowColor,
                            size: 32,
                          ),
                        ),
                        title: Text(
                          controller.favoriteList[index].sing,
                          style:
                          myStyle(family: bold, color: whiteColor, size: 15),
                        ),
                        subtitle: Text(
                          controller.favoriteList[index].singer!,
                          style: myStyle(
                              family: regular, color: whiteColor, size: 12),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.play_arrow,
                              color: whiteColor,
                              size: 26
                          ),
                          onPressed: (){

                            for(int i=0;i<controller.dataAllList.length;i++) {
                              if (favoriteIdList[index]==controller.dataAllList[i].id) {
                                controller.playIndex.value=i;
                                controller.isPlaying.value=true;
                              }
                            }

                            //List<SongModel> favoriteData=[controller.favoriteIdList[index],controller.favoriteSingList[index] ,controller.favoriteSingerList[index] ];

                            Get.to(
                                  () => const Player(),
                              transition: Transition.leftToRightWithFade,
                            );
                          },
                        ),
                        /*const Icon(
                              Icons.music_note,
                              color: whiteColor,
                              size: 32,
                            ), */
                      ),
                  /*InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: bgColor,
                        //color: Colors.white30,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  width:50,
                                  child: QueryArtworkWidget(
                                    id: data[index].id,
                                    type: ArtworkType.AUDIO,
                                    nullArtworkWidget: const Icon(
                                      Icons.music_note,
                                      color: yellowColor,
                                      size: 32,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 6,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index].displayNameWOExt,
                                      style: myStyle(
                                          family: bold,
                                          color: whiteColor,
                                          size: 15),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${data[index].artist}",
                                      style: myStyle(
                                          family: regular,
                                          color: whiteColor,
                                          size: 12),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Visibility(
                                      visible:
                                      controller.playIndex.value == index &&
                                          controller.isPlaying.value,
                                      child: IconButton(
                                        icon: const Icon(Icons.play_arrow,
                                            color: yellowColor, size: 20),
                                        onPressed: () {},
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.favorite_border_outlined,
                                          color: whiteColor, size: 20),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        //controller.playSong(snapshot.data![index].uri, index);
                        Get.to(
                              () => Player(
                            data: data,
                          ),
                          transition: Transition.leftToRightWithFade,
                        );
                        controller.playSong(data[index].uri, index);
                      },
                    ),*/
              );
            },
          ),
        )
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