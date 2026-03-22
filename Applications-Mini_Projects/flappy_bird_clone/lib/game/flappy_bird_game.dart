import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird_clone/components/background.dart';
import 'package:flappy_bird_clone/components/bird.dart';
import 'package:flappy_bird_clone/components/ground.dart';
import 'package:flappy_bird_clone/components/pipe_group.dart';
import 'package:flappy_bird_clone/game/config.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  FlappyBirdGame();

  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isCollided = false;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  @override
  void update(double dt) {
    super.update(dt);

    interval.update(dt);
  }

  @override
  void onTap() {
    super.onTap();

    bird.fly();
  }
}
