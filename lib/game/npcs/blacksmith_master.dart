import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/npcs/npcFunctionalities/npc_dialogue.dart';
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
      idleLeft: NPCSprites.smithMasterStandLeft,
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
      initializeRoutine();
      return super.onLoad();
    }

    @override
    void onReceiveDamage(attacker, double damage, identify, damageType) {
      if (willTalk) {
        // TalkDialog.show(context, getCurrentLines(), style: const TextStyle(fontFamily: 'PressStart2P', fontSize: 24, height: 1.5));
      }
      willTalk = !willTalk;
      super.onReceiveDamage(attacker, 0, identify, damageType);
    }
    List<List<NpcDialogue>> dialogue = [
      [NpcDialogue(
        npcLines: Say(text: [const TextSpan(text: 'Estou cansada de comer morangos, queria que essa fazenda fosse minha para plantar o que eu quiser')],),
        answers:['Porque voce nao compra uma?', 'Porque esta me dizendo isso?', 'Talvez um dia voce possa...'], correctAnswer: 2),],
      [NpcDialogue(
        npcLines: Say(text: [const TextSpan(text: 'Eu sou muito grata ao dono dessas terras, ele me da abrigo, comida... O que seria de mim sem ele?')],),
        answers: ['Voce seria desempregada', 'Voce seria livre', 'Voce passaria fome'], correctAnswer: 1),],
    ];

    // List<Say> masterFirstSwordForged = [
    //   Say(text: [const TextSpan(text: 'That`s a really nice sword, very well made. But you still have much to learn')]),
    // ];

    // List<Say> masterFirstSwordLegendary = [
    //   Say(text: [const TextSpan(text: 'A LEGENDARY??? AS YOUR FIRST SWORD???? I gotta say, kid, you got some serious talent in ya')]),
    // ];

    // List<Say> severalSwords = [
    //   Say(text: [const TextSpan(text: 'I can see someone is excited about the new job, huh? Keep up the good work kid')]),
    // ];

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

    void initializeRoutine() {
      int time = controller.getTime();

      switch (time) {
        case 640:
          animation?.play(SimpleAnimationEnum.idleLeft);
          break;
        case 700:
          animation?.play(SimpleAnimationEnum.idleDown);
          break;
        default:
          // stopMove();
      }
      
      
      Future.delayed(Duration(seconds: 10), () {
        initializeRoutine();
      });
    }
}