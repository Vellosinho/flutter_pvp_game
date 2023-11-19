import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import 'game_controller.dart';
import 'game_sprite_sheet.dart';

class StaticDummy extends SimpleEnemy with ObjectCollision {
  Function onHit;
  LocalGameController controller;
  double minZoom;

  StaticDummy({
    required Vector2 position,  
    required Vector2 size,
    required Vector2 hitboxSize,
    required Vector2 hitboxPosition,
    required this.onHit,
    required this.controller,
    required this.minZoom,
  }) : super(
    position: position,
    size: size,
    speed: 0,
    animation: SimpleDirectionAnimation(
      idleDown: GameSpriteSheet.dummyStand,
      idleRight: GameSpriteSheet.dummyStand,
      runRight: GameSpriteSheet.dummyStand,
      
    ),
    ) {
      setupCollision(
        CollisionConfig(collisions: [
          CollisionArea.rectangle(
            size: hitboxSize,
            align: hitboxPosition,
          )
        ])
      );
    }

    @override
    void receiveDamage(AttackFromEnum attacker, double damage, identify) { 
    onHit();
    gameRef.camera.shake(intensity: 6);
    handleZoom(minZoom);
    animation?.playOnce(
      GameSpriteSheet.dummyHit
    );
    super.receiveDamage(attacker, damage, identify);
  }

  void handleZoom(double minZoom) {
    Future.delayed(const Duration(milliseconds: 250), () {
      gameRef.camera.animateZoom(zoom: minZoom + (controller.hitcount * 0.05), duration : const Duration(milliseconds: 250), curve: Curves.easeInSine);
    });
    Future.delayed(const Duration(seconds: 4), () {
      gameRef.camera.animateZoom(zoom: minZoom + (controller.hitcount * 0.05), duration: const Duration(milliseconds: 250));
    });
  }
}

class BlackSmithMaster extends SimpleAlly with ObjectCollision, Lighting {
  bool willTalk = true;
  BlackSmithMaster({
    required Vector2 position,  
    required Vector2 size,
    required Vector2 hitboxSize,
    required Vector2 hitboxPosition,
  }) : super(
    position: position,
    size: size,
    speed: 0,
    animation: SimpleDirectionAnimation(
      idleDown: GameSpriteSheet.smithMasterStand,
      idleRight: GameSpriteSheet.smithMasterStand,
      runRight: GameSpriteSheet.smithMasterStand,
    ),
    receivesAttackFrom: ReceivesAttackFromEnum.NONE
    ) {
      setupCollision(
        CollisionConfig(collisions: [
          CollisionArea.rectangle(
            size: hitboxSize,
            align: hitboxPosition,
          )
        ])
      );
      // setupLighting(
      //   LightingConfig(
      //     radius: width * 1.25,
      //     color: Colors.transparent,
      //     blurBorder: 160, // this is a default value
      //     // type: LightingType.circle, // this is a default value
      //     // useComponentAngle: false, // this is a default value. When true light rotate together component when change `angle` param.
      //   ),
      // );
    }

    @override
    void receiveDamage(AttackFromEnum attacker, double damage, identify) {
      if (willTalk) {
        TalkDialog.show(context, masterForgeTutorial, style: const TextStyle(fontFamily: 'PressStart2P', fontSize: 24, height: 1.5));
      }
      willTalk = !willTalk;
      super.receiveDamage(attacker, 0, identify);
    }
    List<Say> masterForgeTutorial = [
      Say(text: [const TextSpan(text: 'I can see you’ve understood that dialogue ain`t getting you  nowhere, huh?')]),
      Say(text: [const TextSpan(text: 'So, you chose to be a blacksmith, yeah?')]),
      Say(text: [const TextSpan(text: 'I gotta warn you, being a blacksmith ain`t easy')]),
      Say(text: [const TextSpan(text: 'So pay attention kid, `cause I`m only gonna teach you once')]),
      Say(text: [const TextSpan(text: 'To forge weapons, hit the anvil in that lil forge down there, that`ll start the forging process')]),
      Say(text: [const TextSpan(text: 'Keep attacking the anvil when the pointer is close to the center, the closest, the better the hit')]),
      Say(text: [const TextSpan(text: 'You`ll get 5 hits per sword you forge, try to score as high of a score as you can')]),
      Say(text: [const TextSpan(text: 'And now you just have to put it in the box to sell it, or hand it over to one of your comrades')]),
    ];

    // List<Say> masterGame
}