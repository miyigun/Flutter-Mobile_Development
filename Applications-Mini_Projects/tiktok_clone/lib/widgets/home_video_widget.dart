import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/models/video_model.dart';
import 'package:video_player/video_player.dart';

class HomeVideoWidget extends ConsumerStatefulWidget {
  const HomeVideoWidget({super.key, required this.model});

  final VideoModel model;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeVideoWidgetState();
}

class _HomeVideoWidgetState extends ConsumerState<HomeVideoWidget> {
  late VideoPlayerController controller;

  void playingVideo() {
    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
  }

  void initializedVideoPlayer() {
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.model.url))
      ..initialize().then((value) {
        setState(() {});
        controller.play();
        controller.setLooping(true);
      });
  }

  @override
  void initState() {
    super.initState();

    initializedVideoPlayer();
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final item=widget.model;

    return SizedBox.expand(
      child: controller.value.isInitialized
          ? Stack(
              alignment: Alignment.center,
              children: [
                InkWell(
                  onTap: playingVideo,
                  child: AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Title",
                                      style: textTheme.titleMedium!.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Description" * 12,
                                      style: textTheme.bodyMedium!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  _Profile(widget: widget),
                                  24.height,
                                  ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                        item.isLike
                                            ? Colors.pink.shade700
                                        : Colors.white,
                                        BlendMode.srcIn,
                                    ),
                                    child: actionButton(
                                        icon: Icons.favorite,
                                        text: item.like,
                                      onTap: () {
                                          item.isLike = !item.isLike;
                                          setState(() {
                                            if (!item.isLike) {
                                              item.like-=1;
                                            } else {
                                              item.like+=1;
                                            }

                                          });
                                      }
                                    ),
                                  ),
                                  4.height,
                                  actionButton(icon: Icons.comment, text: item.comment),
                                  4.height,
                                  actionButton(icon: Icons.bookmark, text: item.bookmark),
                                  4.height,
                                  actionButton(icon: Icons.share, text: item.share),
                                ],
                              ),
                            ],
                          ),
                        ),
                        VideoProgressIndicator(
                          controller,
                          allowScrubbing: true,
                          colors: const VideoProgressColors(
                            playedColor: Colors.white,
                          ),
                        ),
                      ],
                    )),
              ],
            )
          : const CircularProgressIndicator.adaptive(),
    );
  }

  Widget actionButton({VoidCallback? onTap, required IconData icon, required int text}){
    return IconButton(
        onPressed: (){
          onTap?.call();
        },
        icon: Column(
          children: [
            Icon(icon, size: 32,color: Colors.white,),
            Text(text.toString(),style: Theme.of(context).textTheme.titleSmall,),
          ],
        )
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile({
    required this.widget,
  });

  final HomeVideoWidget widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white),
            image: DecorationImage(
                image: NetworkImage(
                  widget.model.profilImage,
                ),
                fit: BoxFit.cover),
          ),
        ),
        Positioned.fill(
            bottom: -10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: const Icon(
                  Icons.add,
                  size: 16,
                ),
              ),
            )),
      ],
    );
  }
}

extension NumericExtension on num{
  Widget get height => SizedBox(height: toDouble());  // 12.height
  Widget get width => SizedBox(width: toDouble());
}