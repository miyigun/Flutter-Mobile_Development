import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/model/sing_song_model.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {

  final audioQuery = OnAudioQuery();
  final audioPlayer=AudioPlayer();

  var playIndex=0.obs;
  var isPlaying=false.obs;

  var duration=''.obs;
  var position=''.obs;

  var max=0.0.obs;
  var value=0.0.obs;

  var currentIndex=0.obs;

  var dataAllList=<SongModel>[].obs;

  var favoriteListIndex=0.obs;

  var favoriteSelectedList=[].obs;

  //var favoriteIdList=[].obs;
  //var favoriteSingList=[].obs;
  //var favoriteSingerList=[].obs;

  var searchSingList=[].obs;
  var searchSingerList=[].obs;

  var favoriteList=<SingSongModel>[].obs;

  @override
  void onInit() {

    super.onInit();

    checkPermission();
  }

  void createDataAllList(List<SongModel> pullData){
    //var middleVariable;

    //for (int i=0;i<pullData.length;i++){
    //  middleVariable=SingSongModel(pullData[i].id.toString(), pullData[i].displayName, pullData[i].artist);

     // dataAllList.add(middleVariable);
   // }

    dataAllList.value=pullData;
  }

  void addFavoriteSong(int index,List<SongModel> data){
    var song=SingSongModel(data[index].id, data[index].displayName, data[index].artist);

    favoriteList.add(song);
  }

  searchSing(String singer, int index,List<SongModel> data){
    for(int i=0;i<data.length;i++){
      if (singer==data[i].artist){
        //searchSingList
      }
    }
  }

  changeFavoriteList(index,List <SongModel> data){
    favoriteSelectedList[index]=!favoriteSelectedList[index];

    if (favoriteSelectedList[index]==true) {
      var song=SingSongModel(data[index].id, data[index].displayName, data[index].artist);

      favoriteList.add(song);
    } else {
      for (int i=0;i<favoriteList.length;i++){
        if (favoriteList[i].id==data[index].id){
          favoriteList.removeAt(i);
        }
      }
    }
  }

  updatePosition(){
    audioPlayer.durationStream.listen((d) {
      duration.value=d.toString().split(".")[0];
      max.value=d!.inSeconds.toDouble();
    });

    audioPlayer.positionStream.listen((p) {
      position.value=p.toString().split(".")[0];
      value.value=p.inSeconds.toDouble();
    });
  }

  changeDurationToSeconds(seconds){
    var duration=Duration(seconds: seconds);
    audioPlayer.seek(duration);
  }
  
  playSong(String? uri, index){
    playIndex.value =index;

    try {
      audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(uri!)),
      );
      audioPlayer.play();
      isPlaying(true);
      updatePosition();
    } on Exception catch(e){
      debugPrint(e.toString());
    }
  }

  checkPermission() async{
    var perm=await Permission.storage.request();

    if(perm.isGranted){
      /*return audioQuery.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        sortType: null,
        uriType: UriType.EXTERNAL,

      );*/
    } else {
      checkPermission();
    }
  }

}