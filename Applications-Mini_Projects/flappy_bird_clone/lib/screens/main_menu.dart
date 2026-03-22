import 'package:flappy_bird_clone/game/assets.dart';
import 'package:flappy_bird_clone/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key, required this.game}) : super(key: key);

  final FlappyBirdGame game;
  static const String id = 'mainMenu';

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return GestureDetector(
        onTap: () {
          game.overlays.remove('mainMenu');
          game.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.menu),
              fit: BoxFit.cover,
            ),
          ),
          child: Image.asset(Assets.message),
        ));
  }
}
