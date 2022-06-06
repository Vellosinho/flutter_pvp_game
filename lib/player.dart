import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game_sprite_sheet.dart';

class FighterPlayer extends SimplePlayer with ObjectCollision {
  FighterPlayer({
    required Vector2 position,
    required Vector2 size,
    required double characterSpeed,
    required Vector2 hitboxSize,
    required Vector2 hitboxPosition,
  }) : super(
          position: position,
          size: size,
          animation: SimpleDirectionAnimation(
            idleRight: GameSpriteSheet.archerIdleRight,
            runRight: GameSpriteSheet.archerWalkRight,
            idleUpLeft: GameSpriteSheet.archerIdleLeft,
            runLeft: GameSpriteSheet.archerWalkLeft,
            idleDown: GameSpriteSheet.archerIdleFront,
            runDown: GameSpriteSheet.archerWalkFront,
            idleUp: GameSpriteSheet.archerIdleBack,
            runUp: GameSpriteSheet.archerWalkBack,
          ),
          speed: characterSpeed,
        ) {
    setupCollision(CollisionConfig(collisions: [
      // CollisionArea.rectangle(size: Vector2(32, 12), align: Vector2(32,80))
      CollisionArea.rectangle(size: hitboxSize, align: hitboxPosition)
    ]));
  }
}
