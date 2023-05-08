import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';

import '../game/character_faction.dart';
import '../game/game_sprite_sheet.dart';
import 'player_consts.dart';

/* 
  static Vector2 characterSize = Vector2(192, 192);
  static Vector2 characterHitbox = Vector2(96, 40);
*/

class PlayerOne extends SimplePlayer with ObjectCollision {
  Function onHit;
  double playerLife;
  bool attackReady = true;
  bool dashReady = true;
  final String id;
  PlayerOne({
    required Vector2 position,
    required this.onHit,
    required this.playerLife,
    required CharacterFaction faction,
    required SimpleDirectionAnimation animations,
    required this.id,
  }) : super(
          position: position,
          life: playerLife,
          initDirection: Direction.up,
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

  // @override
  // void joystickAction(JoystickActionEvent event) {
  //   if(hasGameRef && !gameRef.camera.isMoving) {
  //     if(event.id == LogicalKeyboardKey.keyZ.keyId && attackReady) {
  //       simpleAttackMelee(
  //         sizePush: 0.2,
  //         damage: 10,
  //         // size: size * 1.4,
  //         size: size * 1.6,
  //         animationRight: GameSpriteSheet.attackHorizontalRight,
  //         direction: lastDirection,
  //       );
  //       // position.translate(diffBase.x, diffBase.y);
  //       attackReady = false;
  //       Future.delayed(const Duration(seconds: 1), () {
  //         attackReady = true;
  //       });
  //     }
  //   }
  // }

  // Archer Skillset
  @override
  void joystickAction(JoystickActionEvent event) {
    double getDashAngle(String originalAngle) {
      switch (originalAngle) {
        case '3.141592653589793':
          return 1.7453292519943295e-9;
        case '1.7453292519943295e-9':
          return 3.141592653589793;
        case '-0.7853981633974483':
          return 2.356194490192345;
        case '2.356194490192345':
          return -0.7853981633974483;
        case '-2.356194490192345':
          return 0.7853981633974483;
        case '0.7853981633974483':
          return -2.356194490192345;
        case '-1.5707963267948966':
          return 1.5707963267948966;
        case '1.5707963267948966':
          return -1.5707963267948966;
        default:
          return 0.0;
      }
    }

    var initPosition = rectConsideringCollision;

    Vector2 startPosition =
        initPosition.center.toVector2() + Vector2.zero();

    Vector2 diffBase = BonfireUtil.diffMovePointByAngle(
      startPosition,
      350,
      getDashAngle(lastDirection.toRadians().toString())
    );

    startPosition.add(diffBase);
    startPosition.add(Vector2(-size.x / 2, -size.y / 2));

    if(hasGameRef && !gameRef.camera.isMoving) {

      if(event.id == LogicalKeyboardKey.keyZ.keyId && attackReady) {
        simpleAttackRangeByDirection(animationRight: GameSpriteSheet.arrowHorizontalRight,
          attackFrom: AttackFromEnum.PLAYER_OR_ALLY,
          direction: lastDirection,
          size: Vector2(155,95),
          speed: 2000,
          centerOffset: Vector2(0, -60)
        );
        attackReady = false;
        Future.delayed(const Duration(seconds: 1), () {
          attackReady = true;
        });
      }
      if(event.id == LogicalKeyboardKey.keyX.keyId && dashReady) {
        translate(diffBase.x, diffBase.y);
        dashReady = false;
        Future.delayed(const Duration(seconds: 2),() {
          dashReady = true;
        });
      }
    }
  }
}
