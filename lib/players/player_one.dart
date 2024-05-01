import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
import 'package:projeto_gbb_demo/game/game_controller.dart';

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
  bool escPressed = false;
  LocalGameController localGameController;
  final String id;
  PlayerOne({
    required Vector2 position,
    required this.onHit,
    required this.playerLife,
    required CharacterFaction faction,
    required SimpleDirectionAnimation animations,
    required this.localGameController,
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

  @override
  void joystickAction(JoystickActionEvent event) {
    swordsmanHitSet(event);
  }


  void swordsmanHitSet(JoystickActionEvent event) {
    if(event.id == LogicalKeyboardKey.keyZ.keyId && attackReady) {
        swordsmanHit();
        if(localGameController.playAnimation) {
          if(localGameController.swordScore == 250) {
            animation?.playOnce(GameSpriteSheet.forgeLegedarySuccessful);
          } else {
            animation?.playOnce(GameSpriteSheet.forgeSuccessful);
          }
          localGameController.turnOffAnimation();
        }
      }
    if(event.id == LogicalKeyboardKey.keyX.keyId && dashReady) {
      swordsmanDash();
    }
    if(event.id == LogicalKeyboardKey.escape.keyId && !escPressed) {
      localGameController.togglePaused();
      escPressed = true;
      if (localGameController.gameIsPaused) {
        gameRef.pauseEngine();
      } else {
        gameRef.resumeEngine();
      }
      Future.delayed(const Duration(milliseconds: 250), () {
        escPressed = false;
      });
    }
  }

  void swordsmanHit() {
    if(hasGameRef && !gameRef.camera.isMoving) {
        simpleAttackMelee(
          sizePush: 0.2,
          damage: 10,
          size: size * 1.4,
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

  void swordsmanDash() {
    var initPosition = rectConsideringCollision;

    Vector2 startPosition =
        initPosition.center.toVector2() + Vector2.zero();

     Vector2 diffBase = BonfireUtil.diffMovePointByAngle(
      startPosition,
      250,
      lastDirection.toRadians(),
    );


    FutureOr<SpriteAnimation> getAnimation(String direction) {
      switch (direction) {
        case '3.141592653589793':
          return GameSpriteSheet.communistArcherDashLeft;
        case '1.7453292519943295e-9':
          return GameSpriteSheet.communistArcherDashRight;
        case '-0.7853981633974483':
          return GameSpriteSheet.communistArcherDashBack;
        case '2.356194490192345':
          return GameSpriteSheet.communistArcherDashFront;
        case '-2.356194490192345':
          return GameSpriteSheet.communistArcherDashBack;
        case '0.7853981633974483':
          return GameSpriteSheet.communistArcherDashFront;
        case '-1.5707963267948966':
          return GameSpriteSheet.communistArcherDashBack;
        case '1.5707963267948966':
          return GameSpriteSheet.communistArcherDashFront;
        default:
          return GameSpriteSheet.dummyHit;
      }
    }

    animation?.playOnce(
      getAnimation(lastDirection.toRadians().toString())
    );
    
    translate(diffBase.x, diffBase.y);
      dashReady = false;
      Future.delayed(const Duration(seconds: 2),() {
        dashReady = true;
    });

  }

  // Archer Skillset
  // @override
  // void joystickAction(JoystickActionEvent event) {
  //   double getDashAngle(String originalAngle) {
  //     switch (originalAngle) {
  //       case '3.141592653589793':
  //         return 1.7453292519943295e-9;
  //       case '1.7453292519943295e-9':
  //         return 3.141592653589793;
  //       case '-0.7853981633974483':
  //         return 2.356194490192345;
  //       case '2.356194490192345':
  //         return -0.7853981633974483;
  //       case '-2.356194490192345':
  //         return 0.7853981633974483;
  //       case '0.7853981633974483':
  //         return -2.356194490192345;
  //       case '-1.5707963267948966':
  //         return 1.5707963267948966;
  //       case '1.5707963267948966':
  //         return -1.5707963267948966;
  //       default:
  //         return 0.0;
  //     }
  //   }

  //   var initPosition = rectConsideringCollision;

  //   Vector2 startPosition =
  //       initPosition.center.toVector2() + Vector2.zero();

  //   Vector2 diffBase = BonfireUtil.diffMovePointByAngle(
  //     startPosition,
  //     350,
  //     getDashAngle(lastDirection.toRadians().toString())
  //   );

  //   startPosition.add(diffBase);
  //   startPosition.add(Vector2(-size.x / 2, -size.y / 2));

  //   if(hasGameRef && !gameRef.camera.isMoving) {

  //     if(event.id == LogicalKeyboardKey.keyZ.keyId && attackReady) {
  //       simpleAttackRangeByDirection(animationRight: GameSpriteSheet.arrowHorizontalRight,
  //         attackFrom: AttackFromEnum.PLAYER_OR_ALLY,
  //         direction: lastDirection,
  //         size: Vector2(155,95),
  //         speed: 2000,
  //         centerOffset: Vector2(0, -60)
  //       );
  //       attackReady = false;
  //       Future.delayed(const Duration(seconds: 1), () {
  //         attackReady = true;
  //       });
  //     }
  //     if(event.id == LogicalKeyboardKey.keyX.keyId && dashReady) {
  //       translate(diffBase.x, diffBase.y);
  //       dashReady = false;
  //       Future.delayed(const Duration(seconds: 2),() {
  //         dashReady = true;
  //       });
  //     }
  //   }
  // }
}
