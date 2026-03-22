import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class Controller extends GetxController {

  var videoUrl="".obs;

  var videoPlayerController=VideoPlayerController.networkUrl(Uri.parse("")).obs;


}