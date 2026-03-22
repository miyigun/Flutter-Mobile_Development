import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_example/controller/controller.dart';
import 'package:video_player_example/controller/data.dart';
import 'package:video_player_example/view/play_video_screen.dart';

class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Controller());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: uriList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index){

            controller.videoPlayerController.value=VideoPlayerController.networkUrl(Uri.parse(uriList[index]));
            controller.videoPlayerController.value.initialize();

            return Row(
              children: [
                InkWell(
                  child: Stack(
                    children: [
                      Container(
                          width: 200,
                          height: 300,
                          color: Colors.blueGrey,
                          child: VideoPlayer(controller.videoPlayerController.value)
                      ),
                      Positioned(
                        bottom: 50,
                        left: 5,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            '${2010+index}',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 50,
                        left: 70,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.comment,color: Colors.white,),
                              Text(
                                '${200+5*index}',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 50,
                        right: 5,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.star,color: Colors.white,),
                              Text(
                                '${5+0.5*index}',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 10,
                          left: 50,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Video ${index+1}',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                      ),
                    ],

                  ),
                  onTap: (){
                    Get.to(()=>PlayVideoScreen(index: index));
                  },
                ),
                const SizedBox(width: 10),
              ],
            );
          },
        ),
      ),
    );
  }
}
