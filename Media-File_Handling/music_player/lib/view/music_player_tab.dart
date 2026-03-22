import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/controller/consts/colors.dart';
import 'package:music_player/controller/consts/text_style.dart';
import 'package:music_player/controller/player_controller.dart';
import 'package:music_player/view/player.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicPlayerTab extends StatelessWidget {
  const MusicPlayerTab({super.key});

  @override
  Widget build(BuildContext context) {
    PlayerController controller = Get.find();

    return Scaffold(
        backgroundColor: bgDarkColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context){
                      TextEditingController singer=TextEditingController();
                      TextEditingController sing=TextEditingController();
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        title: const Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                                Icons.sort_rounded,
                              size: 60,
                            ),
                            SizedBox(width: 10),
                            Center(child: Text("SIRALAMA PENCERESİ")),
                          ],
                        ),
                        //backgroundColor: bgWhiteColor,
                        content:Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  const Text("Şarkıcı:"),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: 150,
                                      child: TextField(
                                        controller: singer,
                                        //maxLength: 100,
                                        onTap: (){

                                        },
                                      )
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  const Text("Şarkı:"),
                                  const SizedBox(width: 20),
                                  SizedBox(
                                      width: 150,
                                      child: TextField(
                                        controller: sing,
                                        //maxLength: 50,
                                        onTap: (){
                                          //controller.searchSing(sing.text, index, data);
                                        },
                                      )
                                  ),
                                ],
                              ),
                            ],
                          ),
                        actions: [
                          ElevatedButton(
                              onPressed: (){
                                for(int i=0;i<controller.dataAllList.length;i++){
                                  if (singer.text==controller.dataAllList[i].artist){

                                  }
                                }
                              },
                              child: const Text("Ara")
                          ),
                          ElevatedButton(
                              onPressed: (){
                                Get.back();
                              },
                              child: const Text("Vazgeç")
                          ),
                        ],

                      );
                    }
                );
              },
              icon: const Icon(Icons.sort_rounded, color: yellowColor),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context){
                      TextEditingController singer=TextEditingController();
                      TextEditingController sing=TextEditingController();
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        title: const Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search,
                              size: 60,
                            ),
                            SizedBox(width: 10),
                            Center(child: Text("ARAMA PENCERESİ")),
                          ],
                        ),
                        //backgroundColor: bgWhiteColor,
                        content:Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                const Text("Şarkıcı:"),
                                const SizedBox(width: 10),
                                SizedBox(
                                    width: 150,
                                    child: TextField(
                                      controller: singer,
                                      //maxLength: 100,
                                      onTap: (){

                                      },
                                    )
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                const Text("Şarkı:"),
                                const SizedBox(width: 20),
                                SizedBox(
                                    width: 150,
                                    child: TextField(
                                      controller: sing,
                                      //maxLength: 50,
                                      onTap: (){

                                      },
                                    )
                                ),
                              ],
                            ),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: (){},
                              child: const Text("Ara")
                          ),
                          ElevatedButton(
                              onPressed: (){
                                Get.back();
                              },
                              child: const Text("Vazgeç")
                          ),
                        ],

                      );
                    }
                );
              },
              icon: const Icon(Icons.search, color: yellowColor),
            ),
            /*IconButton(
              onPressed: () {},
              icon: const Icon(Icons.sort_rounded, color: yellowColor),
            ),*/
          ],
          //leading: const Icon(Icons.menu, color: yellowColor),
          title: Text(
            "Müzik Oynatıcı",
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
              itemCount: controller.dataAllList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: Obx(
                    () =>
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tileColor: controller.playIndex.value == index &&  controller.isPlaying.value
                          ? Colors.blueGrey :bgColor,
                      title: Text(
                        controller.dataAllList[index].displayName,
                        style:
                            myStyle(family: bold, color: whiteColor, size: 15),
                      ),
                      subtitle: Text(
                        "${controller.dataAllList[index].artist}",
                        style: myStyle(
                            family: regular, color: whiteColor, size: 12),
                      ),
                      leading: QueryArtworkWidget(
                        id: controller.dataAllList[index].id,
                        type: ArtworkType.AUDIO,
                        nullArtworkWidget: const Icon(
                          Icons.music_note,
                          color: yellowColor,
                          size: 32,
                        ),
                      ),
                       /*const Icon(
                              Icons.music_note,
                              color: whiteColor,
                              size: 32,
                            ), */
                      trailing:
                      /*controller.playIndex.value == index &&
                              controller.isPlaying.value
                          ? const Icon(Icons.play_arrow,
                              color: yellowColor, size: 26)
                          : */
                      IconButton(
                              icon: controller.favoriteSelectedList[index]
                                  ? const Icon(Icons.favorite, color: Colors.red, size: 26)
                              : const Icon(Icons.favorite_border_outlined, color: whiteColor, size: 26),
                              onPressed: () {
                                controller.changeFavoriteList(index,controller.dataAllList);

                                //print(controller.favoriteSelectedList.value.toString());
                              },
                            ),
                      onTap: () {

                        //controller.playSong(snapshot.data![index].uri, index);
                        Get.to(
                          () => const Player(),
                          transition: Transition.leftToRightWithFade,
                        );
                        controller.playSong(controller.dataAllList[index].uri, index);
                      },
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
                  ),
                );
              }),
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
