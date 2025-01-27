import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_gbb_demo/game/enum/one_time_animations.dart';
import 'package:projeto_gbb_demo/game/game_controller.dart';

import '../game/enum/character_faction.dart';
import '../game/game_sprite_sheet.dart';
import 'player_consts.dart';

/* 
  static Vector2 characterSize = Vector2(192, 192);
  static Vector2 characterHitbox = Vector2(96, 40);
*/

class PlayerOne extends SimplePlayer with BlockMovementCollision {
  Function onHit;
  double playerLife;
  bool attackReady = true;
  bool dashReady = true;
  bool escPressed = false;
  bool isArmed = false;
  LocalGameController localGameController;

  bool _isPlayingOneTimeAnimation = false;

  final String id;
  PlayerOne({
    required Vector2 position,
    required this.onHit,
    required this.playerLife,
    required CharacterFaction faction,
    required this.localGameController,
    required this.id,
  }) : super(
          position: position,
          life: playerLife,
          initDirection: Direction.down,
          size: PlayerConsts.characterSize,
          animation: communistUnarmedBlacksmith,
          // speed: PlayerConsts.characterSpeed,
          speed: PlayerConsts.characterSpeed,
        ) {}
  @override
  Future<void> onLoad() {
    add(RectangleHitbox(size: PlayerConsts.characterHitbox, position: PlayerConsts.characterHitboxPosition));
    return super.onLoad();
  }

  @override
  void onReceiveDamage(attacker, double damage, identify) {
    onHit();
    super.onReceiveDamage(attacker, damage, identify);
  }

  @override
  void onJoystickAction(JoystickActionEvent event) {
    swordsmanHitSet(event);
    return super.onJoystickAction(event);
  }

  @override
    void update(double dt) {
      localGameController.checkMinigameDistance(position);
      playOneTimeAnimations();
      _isPlayingOneTimeAnimation = localGameController.playAnimation != OneTimeAnimations.none;
      super.update(dt);
    }


  void swordsmanHitSet(JoystickActionEvent event) {
    if(event.id.keyId == LogicalKeyboardKey.keyZ.keyId && attackReady) {
        swordsmanHit();
      }
    if(event.id.keyId == LogicalKeyboardKey.keyX.keyId && dashReady && !_isPlayingOneTimeAnimation) {
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

  void equipWeapon() {
    gameRef.camera.animateZoom(
      zoom: Vector2(1, 1),
      effectController: EffectController(
        duration: 0.250,
        curve: Curves.easeInSine,
      ),
    );
    isArmed = true;
    replaceAnimation(communistArmedBlacksmith);
    speed = PlayerConsts.slowCharacterSpeed;
    
    animation?.playOnce(GameSpriteSheet.equippingHammer);
    animation?.play(SimpleAnimationEnum.idleDown);
    
    Future.delayed(Duration(seconds: 1), () {
      gameRef.camera.animateZoom(
      zoom: Vector2(0.96, 0.96),
      effectController: EffectController(
        duration: 0.250,
        curve: Curves.easeInSine,
      ),
    );
    }); 
  }

  void swordsmanHit() {
    // if(hasGameRef && !gameRef.camera.) {
    if(hasGameRef) {
        simpleAttackMelee(
          sizePush: 0.2,
          damage: isArmed ? 20 : 5,
          size: size * 1.15,
          animationRight: isArmed ? GameSpriteSheet.hammerAttackHorizontalRight : GameSpriteSheet.attackHorizontalRight,
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
    Vector2 initPosition = gameRef.player?.position.gg ?? Vector2(0,0);

    Vector2 startPosition =
        initPosition + Vector2.zero();

     Vector2 diffBase = BonfireUtil.diffMovePointByAngle(
      startPosition,
      250,
      lastDirection.toRadians(),
    );


    FutureOr<SpriteAnimation> getArmedAnimation(String direction) {
      switch (direction) {
        case '3.141592653589793':
          return GameSpriteSheet.communistArmedBlacksmithDashLeft;
        case '1.7453292519943295e-9':
          return GameSpriteSheet.communistArmedBlacksmithDashRight;
        case '-0.7853981633974483':
          return GameSpriteSheet.communistArmedBlacksmithDashBack;
        case '2.356194490192345':
          return GameSpriteSheet.communistArmedBlacksmithDashFront;
        case '-2.356194490192345':
          return GameSpriteSheet.communistArmedBlacksmithDashBack;
        case '0.7853981633974483':
          return GameSpriteSheet.communistArmedBlacksmithDashFront;
        case '-1.5707963267948966':
          return GameSpriteSheet.communistArmedBlacksmithDashBack;
        case '1.5707963267948966':
          return GameSpriteSheet.communistArmedBlacksmithDashFront;
        default:
          return GameSpriteSheet.dummyHit;
      }
    }

    FutureOr<SpriteAnimation> getUnarmedAnimation(String direction) {
      switch (direction) {
        case '3.141592653589793':
          return GameSpriteSheet.communistUnarmedBlacksmithDashLeft;
        case '1.7453292519943295e-9':
          return GameSpriteSheet.communistUnarmedBlacksmithDashRight;
        case '-0.7853981633974483':
          return GameSpriteSheet.communistUnarmedBlacksmithDashBack;
        case '2.356194490192345':
          return GameSpriteSheet.communistUnarmedBlacksmithDashFront;
        case '-2.356194490192345':
          return GameSpriteSheet.communistUnarmedBlacksmithDashBack;
        case '0.7853981633974483':
          return GameSpriteSheet.communistUnarmedBlacksmithDashFront;
        case '-1.5707963267948966':
          return GameSpriteSheet.communistUnarmedBlacksmithDashBack;
        case '1.5707963267948966':
          return GameSpriteSheet.communistUnarmedBlacksmithDashFront;
        default:
          return GameSpriteSheet.dummyHit;
      }
    }

    animation?.playOnce(
      isArmed ? getArmedAnimation(lastDirection.toRadians().toString()) 
      : getUnarmedAnimation(lastDirection.toRadians().toString())
    );
    
    translate(diffBase);
      dashReady = false;
      Future.delayed(const Duration(seconds: 2),() {
        dashReady = true;
    });

  }

  void playOneTimeAnimations() {
    if (localGameController.playAnimation != OneTimeAnimations.none) {
      Future.delayed(Duration(milliseconds: 0), () {
        switch (localGameController.playAnimation) {
          case OneTimeAnimations.swordComplete:
            animation?.playOnce(GameSpriteSheet.forgeSuccessful);
            turnOffAnimation();
            return ;
          case OneTimeAnimations.perfectSwordComplete:
            animation?.playOnce(GameSpriteSheet.forgeLegedarySuccessful);
            turnOffAnimation();
            return ;
          case OneTimeAnimations.acquiredIron:
            animation?.playOnce(GameSpriteSheet.acquiredIron);
            turnOffAnimation();
            return ;
          case OneTimeAnimations.shrug:
            animation?.playOnce(isArmed ? GameSpriteSheet.communistArmedBlacksmithShrug : GameSpriteSheet.communistUnarmedBlacksmithShrug);
              turnOffAnimation();
            return ;
          case OneTimeAnimations.acquiredHammer:
            // equipWeapon();
            replaceAnimation(communistArmedBlacksmith);
            turnOffAnimation();
            Future.delayed(Duration(milliseconds: 50),() {
            animation?.playOnce(GameSpriteSheet.equippingHammer);
              isArmed = true;
              speed = PlayerConsts.slowCharacterSpeed;
              animation?.play(SimpleAnimationEnum.idleDown);
            });
            return ;
          default:
            return ;
          }
        }
      );
    }
  }
  void turnOffAnimation() {
      localGameController.turnOffAnimation();
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
