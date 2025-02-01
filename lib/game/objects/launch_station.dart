import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/objects/object_sprites.dart';

class LaunchStation extends GameDecoration {
  LocalGameController localGameController;
  LaunchStation({
    required super.position,required this.localGameController})
      : super.withSprite(sprite: GameObjectsSprites.launchStation, size: Vector2(552, 420)) 
;    @override
    Future<void> onLoad() {
      add(RectangleHitbox(size:Vector2(152, 0), position: Vector2(200, -400),));
      return super.onLoad();
    }

    @override
    void update(double dt) {
        // do anything
        super.update(dt); 
    }
} 