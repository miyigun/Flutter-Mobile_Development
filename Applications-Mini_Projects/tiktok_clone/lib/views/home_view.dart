import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/widgets/home_top_widget.dart';
import 'package:tiktok_clone/widgets/home_videos_list.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    return const Scaffold(
      body: Stack(
        children: [
          HomeVideosList(),
          HomeTopWidget(),
        ],
      )
    );
  }
}
