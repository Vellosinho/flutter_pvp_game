import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
import 'package:projeto_gbb_demo/character_faction.dart';
import 'package:projeto_gbb_demo/game_sprite_sheet.dart';

class FighterPlayer extends SimplePlayer with ObjectCollision {
  Function onHit;
  double playerLife;
  bool attackReady = true;
  FighterPlayer({
    required Vector2 position,
    required Vector2 size,
    required double characterSpeed,
    required Vector2 hitboxSize,
    required Vector2 hitboxPosition,
    required this.onHit,
    required this.playerLife,
    required CharacterFaction faction,
    required SimpleDirectionAnimation animations,
  }) : super(
          position: position,
          life: playerLife,
          // initDirection: Direction.down,
          initDirection: Direction.up,
          size: size,
          animation: animations,
          speed: characterSpeed,
        ) {
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(size: hitboxSize, align: hitboxPosition)
    ]));
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    onHit();
    super.receiveDamage(attacker, damage, identify);
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if(hasGameRef && !gameRef.camera.isMoving) {
      if(event.id == LogicalKeyboardKey.keyZ.keyId && attackReady) {
        simpleAttackMelee(
          sizePush: 0.2,
          damage: 10,
          // size: size * 1.4,
          size: size * 1.6,
          animationRight: GameSpriteSheet.attackHorizontalRight,
          direction: lastDirection,
        );
        // position.translate(diffBase.x, diffBase.y);
        attackReady = false;
        Future.delayed(const Duration(seconds: 1), () {
          attackReady = true;
        });
      }
    }
  }
}
