import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/models/video_model.dart';

final homeProvider = ChangeNotifierProvider((_) => HomeProvider());

class HomeProvider extends ChangeNotifier {
  final videoList = [
    VideoModel(
        url: "https://player.vimeo.com/progressive_redirect/playback/856119472/rendition/360p/file.mp4?loc=external&oauth2_token_id=57447761&signature=57433597e685afbcd4a340bc07b0ca658469dcdc7c1813ceff125810140edd4c",
        like: 1244,
        comment: 123,
        bookmark: 23,
        share: 64
    ),
    VideoModel(
        url: "https://player.vimeo.com/progressive_redirect/playback/881039144/rendition/360p/file.mp4?loc=external&oauth2_token_id=1747418641&signature=0f6d3c7ea52c152461308092d05b7433e2152a9b5d109e650f7c6327d026ae98",
        like: 13,
        comment: 4,
        bookmark: 45,
        share: 45
    ),
    VideoModel(
        url: "https://player.vimeo.com/external/567750841.sd.mp4?s=1c68c79a6579b2c3e319f0e833279f9dc9f543bf&profile_id=164&oauth2_token_id=57447761",
        like: 124,
        comment: 456,
        bookmark: 45,
        share: 14
    ),
    VideoModel(
        url: "https://player.vimeo.com/progressive_redirect/playback/727150722/rendition/360p/file.mp4?loc=external&oauth2_token_id=57447761&signature=561d913e6ed89cfaea768f672045cbe7288c64fd8dbeff1a06610b767ff35b59",
        like: 1244,
        comment: 123,
        bookmark: 23,
        share: 64
    ),
    VideoModel(
        url: "https://player.vimeo.com/progressive_redirect/playback/886863626/rendition/360p/file.mp4?loc=external&oauth2_token_id=1747418641&signature=dc94574c760bc536cebf93d5418d4675a2d7a35299e9bdeaa115437339308154",
        like: 1244,
        comment: 123,
        bookmark: 23,
        share: 64
    ),
    VideoModel(
        url: "https://player.vimeo.com/external/480053502.sd.mp4?s=28e70c53be35a7da0a1950b470a92343b31166ad&profile_id=164&oauth2_token_id=57447761",
        like: 1244,
        comment: 123,
        bookmark: 23,
        share: 64
    ),
    VideoModel(
        url: "https://player.vimeo.com/progressive_redirect/playback/891643300/rendition/540p/file.mp4?loc=external&oauth2_token_id=1747418641&signature=eafaf8fbf65e988303fc860a09a252e0a89a35c990b1c12cfcd9e85df7949cee",
        like: 1244,
        comment: 123,
        bookmark: 23,
        share: 64
    ),
    VideoModel(
        url: "https://player.vimeo.com/progressive_redirect/playback/668410459/rendition/360p/360p.mp4?loc=external&oauth2_token_id=57447761&signature=fd3f3d7b516d2fbaf948d6762af508745bbb80cfb886a63acb87e62e654f30ba",
        like: 1244,
        comment: 123,
        bookmark: 23,
        share: 64
    ),
  ];
}
