import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/models/custom_bottombar_model.dart';
import 'package:tiktok_clone/views/add_view.dart';
import 'package:tiktok_clone/views/discover_view.dart';
import 'package:tiktok_clone/views/home_view.dart';
import 'package:tiktok_clone/views/messages_view.dart';
import 'package:tiktok_clone/views/profile_view.dart';

final baseViewProvider=ChangeNotifierProvider((_) => BaseViewProvider());

class BaseViewProvider extends ChangeNotifier {
  int currentIndex=0;

  final bottomBarItems=[
    CustomBottomBarModel(icon: Icons.home, text: "Ana sayfa"),
    CustomBottomBarModel(icon: Icons.compass_calibration_rounded, text: "Keşfet"),
    CustomBottomBarModel(icon: Icons.add_box),
    CustomBottomBarModel(icon: Icons.message_rounded, text: "Gelen Kutusu"),
    CustomBottomBarModel(icon: Icons.person, text: "Profil"),
  ];

  Widget get body =>  switch(currentIndex) {
    0 => const HomeView(),
    1 =>  const DiscoverView(),
    2 =>  const AddView(),
    3 =>  const MessagesView(),
    4 =>  const ProfileView(),
    _ =>  const HomeView(),
  };

  void changePage(int newIndex) {
    currentIndex=newIndex;

    notifyListeners();
  }

}
