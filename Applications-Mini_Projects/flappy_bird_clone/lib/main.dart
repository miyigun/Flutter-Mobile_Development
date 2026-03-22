import 'package:flame/game.dart';
import 'package:flappy_bird_clone/game/flappy_bird_game.dart';
import 'package:flappy_bird_clone/screens/game_over.dart';
import 'package:flappy_bird_clone/screens/main_menu.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final game = FlappyBirdGame();

  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const ['mainMenu'],
      overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenuScreen(game: game),
        'gameOver': (context, _) => GameOverScreen(game: game),
      },
    ),
  );
}
