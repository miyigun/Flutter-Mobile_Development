import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/controllers/home_provider.dart';
import 'package:tiktok_clone/widgets/home_video_widget.dart';

class HomeVideosList extends ConsumerWidget {
  const HomeVideosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read=ref.read(homeProvider);

    return PageView.builder(
      itemCount: read.videoList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context , index) {
          return HomeVideoWidget(model: read.videoList.elementAt(index));
        },
    );
  }
}
