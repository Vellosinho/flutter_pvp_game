import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';

import '../game/character_faction.dart';
import '../game/game_sprite_sheet.dart';
import 'player_consts.dart';

class PlayerTwo extends SimpleEnemy with ObjectCollision {
  Function onHit;
  double playerLife;
  bool attackReady = true;
  String id;
  PlayerTwo({
    required Vector2 position,
    required this.onHit,
    required this.playerLife,
    required CharacterFaction faction,
    required SimpleDirectionAnimation animations,
    required Direction direction,
    required this.id,
  }) : super(
          position: position,
          life: playerLife,
          initDirection: direction,
          size: PlayerConsts.characterSize,
          animation: animations,
          speed: PlayerConsts.characterSpeed,
        ) {
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(size: PlayerConsts.characterHitbox, align: PlayerConsts.hitboxPosition)
    ]));
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    onHit();
    super.receiveDamage(attacker, damage, identify);
  }

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
