import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/controller/consts/colors.dart';
import 'package:music_player/controller/consts/text_style.dart';
import 'package:music_player/view/favorite_sing_screen.dart';

class ToolsTab extends StatelessWidget {
  const ToolsTab({super.key});

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
              leading: const Icon(Icons.favorite, color: Colors.red,size: 30),
              title: Text("Beğendiğim Şarkılar",
                style: myStyle(family: bold, color: yellowColor, size: 24),
              ),
              onTap: (){

                Get.to(const FavoriteSingScreen());
                /*var favoriteIdList=[];
                var favoriteSingList=[];
                var favoriteSingerList=[];

                //Favori şarkı ve şarkıcı listesinde boş olmayan indeksler ayrı bir listeye alınıyor
                for (int i=0;i<controller.favoriteSingList.length;i++){
                  if (controller.favoriteSingList[i]!=''){
                    favoriteIdList.add(controller.favoriteIdList[i]);
                    favoriteSingList.add(controller.favoriteSingList[i]);
                    favoriteSingerList.add(controller.favoriteSingerList[i]);
                  }
                }

                print(favoriteIdList.toString());
                print(favoriteSingList.toString());
                print(favoriteSingerList.toString());


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
                        title: Row(
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
                        content:ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: favoriteSingList.length,
                          itemBuilder: (BuildContext context, int index){
                            return Container(
                              margin: const EdgeInsets.only(bottom: 4),
                              child: Obx(
                                    () =>
                                    ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      tileColor: bgColor,
                                      title: Text(
                                        favoriteSingList[index].toString(),
                                        style:
                                        myStyle(family: bold, color: whiteColor, size: 15),
                                      ),
                                      subtitle: Text(
                                        favoriteSingerList[index].toString(),
                                        style: myStyle(
                                            family: regular, color: whiteColor, size: 12),
                                      ),
                                      leading: const Icon(
                                      Icons.music_note,
                                      color: whiteColor,
                                      size: 32,
                                    ),
                                      *//*const Icon(
                              Icons.music_note,
                              color: whiteColor,
                              size: 32,
                            ), *//*
                                    ),
                                *//*InkWell(
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
                    ),*//*
                              ),
                            );
                          },
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: (){},
                              child: Text("Ara")
                          ),
                          ElevatedButton(
                              onPressed: (){
                                Get.back();
                              },
                              child: Text("Vazgeç")
                          ),
                        ],

                      );
                    }
                );*/
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: bgColor,
              leading: const Icon(Icons.list_alt, color: Colors.white,size: 30,),
              title: Text("Yeni Çalma Listesi Oluştur",
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
              leading: const Icon(Icons.list_outlined, color: Colors.white, size: 30),
              title: Text("Çalma Listelerim",
                style: myStyle(family: bold, color: yellowColor, size: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
