import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
import 'package:projeto_gbb_demo/game/enum/one_time_animations.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/players/player_one/player_one_animations.dart';

import '../../game/enum/character_faction.dart';
import '../../game/game_sprite_sheet.dart';
import '../player_consts.dart';

/* 
  static Vector2 characterSize = Vector2(192, 192);
  static Vector2 characterHitbox = Vector2(96, 40);
*/

class PlayerOne extends SimplePlayer with BlockMovementCollision, Lighting {
  Function onHit;
  double playerLife;
  PlayerOneAnimations playerOneAnimations = PlayerOneAnimations();

  // control booleans:
  bool attackReady = true;
  bool dashReady = true;
  bool holdReady = true;
  int holdHits = 0;


  bool escPressed = false;
  bool isArmed = false;
  bool attackHold = false;
  bool holdAttackUsed = false;
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
    setupLighting(
      LightingConfig(
        radius: 0,
        color: Color(0xffea5c0a).withAlpha(80),
        blurBorder: 160, // this is a default value
        // type: LightingType.circle, // this is a default value
        // useComponentAngle: false, // this is a default value. When true light rotate together component when change `angle` param.
      ),
    );
    // gameRef?.camera.animateZoom(zoom: Vector2(0.8, 0.8));
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
    if(event.id.keyId == LogicalKeyboardKey.keyZ.keyId && attackReady && event.event == ActionEvent.DOWN && isArmed) {
        holdHits = 0;
        attackHold = true;
        Future.delayed(Duration(milliseconds: 200),() {
          if (attackHold) {
            // setupLighting(
            //   LightingConfig(
            //     radius: 3 * width / 4,
            //     color: Color(0xffea5c0a).withAlpha(80),
            //     blurBorder: 80, // this is a default value
            //     align: Vector2(0, 128),
            //     // type: LightingType.circle, // this is a default value
            //     // useComponentAngle: false, // this is a default value. When true light rotate together component when change `angle` param.
            //   ),
            // );
            replaceAnimation(spinningBlacksmithAttack);
            holdAttackUsed = true;
            holdReady = false;
            spinAttack();
          } 
        });
      }
    if(event.id.keyId == LogicalKeyboardKey.keyZ.keyId && attackReady && event.event == ActionEvent.UP) {
      attackHold = false;
      if (holdAttackUsed) {
        // setupLighting(
        //   LightingConfig(
        //     radius: 0,
        //     color: Color(0xffea5c0a).withAlpha(80),
        //     blurBorder: 160, // this is a default value
        //     // type: LightingType.circle, // this is a default value
        //     // useComponentAngle: false, // this is a default value. When true light rotate together component when change `angle` param.
        //   ),
        // );
        holdReady = false;
        isArmed ? replaceAnimation(communistArmedBlacksmith) : null;
        holdAttackUsed = false;
      }
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

  void spinAttack() {
    simpleAttackMelee(
      centerOffset: Vector2(-96, 0),
      // sizePush: 0.2,
      withPush: false,
      damage: 10,
      size: Vector2(384, 276),
      animationRight: GameSpriteSheet.hammerSpinAttack,
      direction: Direction.right,
    );
    Future.delayed(Duration(milliseconds: 300), () {
      if(attackHold && holdHits  < 10) {
        spinAttack();
        holdHits++;
      } else {
        holdReady = false;
          // setupLighting(
          // LightingConfig(
          //   radius: 0,
          //   color: Color(0xffea5c0a).withAlpha(80),
          //   blurBorder: 160,
          //   align: Vector2(96, 0)
          //   ),
          // );
        replaceAnimation(communistArmedBlacksmith);
        Future.delayed(Duration(seconds: 10), () {
          holdReady = true;
        });
      }
    });
  }

  void swordsmanHit() {
    // if(hasGameRef && !gameRef.camera.) {
    print(position);
    if(hasGameRef) {
        simpleAttackMelee(
          sizePush: 0.2,
          damage: isArmed ? 20 : 5,
          withPush: isArmed ? true : false,
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

    animation?.playOnce(
      isArmed ? playerOneAnimations.getArmedAnimation(lastDirection.toRadians().toString()) 
      : playerOneAnimations.getUnarmedAnimation(lastDirection.toRadians().toString())
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
            Future.delayed(Duration(milliseconds: 250),() {
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
