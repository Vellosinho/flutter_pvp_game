import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/game/game_controller.dart';
import 'package:projeto_gbb_demo/game/npcs/npcs_sprite_sheet.dart';

class BlackSmithMaster extends SimpleAlly with Lighting {
  Vector2 hitboxSize;
  Vector2 hitboxPosition;
  LocalGameController controller;
  bool willTalk = true;
  bool tutorialExplained = false;
  BlackSmithMaster({
    required Vector2 position,  
    required Vector2 size,
    required this.hitboxSize,
    required this.hitboxPosition,
    required this.controller,
  }) : super(
    position: position,
    size: size,
    speed: 0,
    animation: SimpleDirectionAnimation(
      idleDown: NPCSprites.smithMasterStand,
      idleRight: NPCSprites.smithMasterStand,
      runRight: NPCSprites.smithMasterStand,
    ),
    receivesAttackFrom: AcceptableAttackOriginEnum.ALL
    ) {
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
    Future<void> onLoad() {
      add(RectangleHitbox(size: hitboxSize, position: hitboxPosition));
      return super.onLoad();
    }

    @override
    void onReceiveDamage(attacker, double damage, identify) {
      // if (willTalk) {
      //   TalkDialog.show(context, getCurrentLines(), style: const TextStyle(fontFamily: 'PressStart2P', fontSize: 24, height: 1.5));
      // }
      willTalk = !willTalk;
      super.onReceiveDamage(attacker, 0, identify);
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

    List<Say> masterFirstSwordForged = [
      Say(text: [const TextSpan(text: 'That`s a really nice sword, very well made. But you still have much to learn')]),
    ];

    List<Say> masterFirstSwordLegendary = [
      Say(text: [const TextSpan(text: 'A LEGENDARY??? AS YOUR FIRST SWORD???? I gotta say, kid, you got some serious talent in ya')]),
    ];

    List<Say> severalSwords = [
      Say(text: [const TextSpan(text: 'I can see someone is excited about the new job, huh? Keep up the good work kid')]),
    ];

    // List<Say> getCurrentLines() {
    //   if(!tutorialExplained && controller.swords.isEmpty) {
    //     tutorialExplained = true;
    //     return masterForgeTutorial;
    //   } else {
    //     if (controller.swords.length == 1) {
    //       if (controller.swords[0].isLegendary) {
    //         return masterFirstSwordLegendary;
    //       } else {
    //         return masterFirstSwordForged;
    //       }
    //     } else {
    //       return severalSwords;
    //     }
    //   }
    // }
}