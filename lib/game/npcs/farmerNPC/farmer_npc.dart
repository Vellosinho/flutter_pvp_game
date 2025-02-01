import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/npcs/farmerNPC/farmer_ally.dart';
import 'package:projeto_gbb_demo/game/npcs/npcFunctionalities/npc_dialogue.dart';
import 'package:projeto_gbb_demo/game/npcs/npcFunctionalities/npc_say.dart';
import 'package:projeto_gbb_demo/game/npcs/npc_points_of_interest.dart';
import 'package:projeto_gbb_demo/game/npcs/npcs_sprite_sheet.dart';
import 'package:projeto_gbb_demo/players/player_consts.dart';
import 'package:provider/provider.dart';
import 'package:projeto_gbb_demo/game/controller/npc_controller.dart';

class FarmerNPC extends SimpleAlly {
  LocalGameController controller;
  bool isbusy = false;
  int index = 0;
  int currentConversation = 0;
  bool willTalk = true;
  List<List<NpcDialogue>> dialogue;

  Vector2 currentDestination = PointsOfInterest.blacksmithMaster;
  Function currentTask = () {};

  FarmerNPC({
    required Vector2 position,
    required Direction initDirection,
    required this.dialogue,
    required int index,
    required this.controller,
  }) : super(
    position: position,
    size: PlayerConsts.tallNPCSize,
    speed: PlayerConsts.npcSpeed / 2,
    initDirection: initDirection,
    animation: NeutralFarmerNPCSprites().neutralFarmerAnimations,
    receivesAttackFrom: AcceptableAttackOriginEnum.ALL,
    keepRendered: true,
    );

    // List<List<NpcDialogue>> dialogue = [
    //   [NpcDialogue(
    //     npcLines: Say(text: [const TextSpan(text: 'Estou cansada de comer morangos, queria que essa fazenda fosse minha para plantar o que eu quiser')],),
    //     answers:['Porque voce nao compra uma?', 'Porque esta me dizendo isso?', 'Talvez um dia voce possa...'], correctAnswer: 2),],
    //   [NpcDialogue(
    //     npcLines: Say(text: [const TextSpan(text: 'Eu sou muito grata ao dono dessas terras, ele me da abrigo, comida... O que seria de mim sem ele?')],),
    //     answers: ['Voce seria desempregada', 'Voce seria livre', 'Voce passaria fome'], correctAnswer: 1),],
    // ];

    @override
    Future<void> onLoad() {
      add(RectangleHitbox(size: PlayerConsts.characterHitbox, position: PlayerConsts.hitboxPosition));
      initializeRoutine();
      
      // checkHasToMove();
      return super.onLoad();
    }

    @override
    void onReceiveDamage(attacker, double damage, identify) {
      // if (willTalk) {
      //   TalkDialog.show(context, getCurrentLines(), style: const TextStyle(fontFamily: 'PressStart2P', fontSize: 24, height: 1.5));
      // }
      // convert();
      if (willTalk && currentConversation < dialogue.length) {
        talk();
      }
      checkAffinity();
      willTalk = !willTalk;
      super.onReceiveDamage(attacker, 0, identify);
    }

    void checkAffinity() {
      if (context.read<NPCController>().npcs[index].affinity >= 5) {
        convert();
      }
    }

    void talk() {
      NPCDialog.show(
        context, index, dialogue[currentConversation], style: const TextStyle(fontFamily: 'PressStart2P', fontSize: 24, height: 1.5, color: Colors.white),
        );
        currentConversation++;
    }

    void convert() {
      controller.playerFollowersAdd();
      gameRef.add(FarmerAlly(position: position, size: size, hitboxPosition: PlayerConsts.hitboxPosition, hitboxSize: PlayerConsts.characterHitbox, controller: controller));
      toggleKeepRendered();
      removeFromParent();
    }

    @override
    void update(double dt) {
      // moveToPosition(Vector2(1749.2115225360892,4038.724698533417));
      // goToDestiny()
      checkHasToMove();
      super.update(dt);
    }

    void checkHasToMove() {
      if (((position.x >= currentDestination.x - 175) && (position.x <= currentDestination.x + 175)) && ((position.y >= currentDestination.y - 175) && (position.y <= currentDestination.y + 175))) {
        stopMove();
        if (!isbusy) {
          isbusy = true;
          currentTask();
        }
      }else {
        isbusy = false;
        goToDestiny();
      }
      // Future.delayed(Duration(milliseconds: 500), () {
      //   checkHasToMove();
      // });
    }

   
    void doNothing() {
      replaceAnimation(NeutralFarmerNPCSprites().neutralFarmerAnimations);
    }

    void goToDestiny() {
      moveToPosition(currentDestination);
    }

    void initializeRoutine() {
      int time = controller.getTime();

      switch (time) {
        case 700:
          shuffleRoutine();
          break;
        case 1100:
          shuffleRoutine();
          break;
        case 1500:
          shuffleRoutine();
          break;
        case 1800:
          print('Day over');
          break;
        case 1850:
          returnHome();
          break;
        //   stopMove();
        //   moveLeft();
        //   moveDown();
        //   break;
        // case 620:
        //   moveLeft();
        //   break;
        // case 630:
        //   stopMove();
          // break;
        default:
          // stopMove();
      }
      
      
      Future.delayed(Duration(seconds: 10), () {
        initializeRoutine();
      });
    }

  void shuffleRoutine() {
    Random rand = Random();

    int nextTask = rand.nextInt(3);
    print('number: $nextTask');

    switch (nextTask) {
      case 0:
        gatherStrawberry();
        break;
      case 1:
        read();
        break;
      case 2:
        pray();
        break;
      default:
        gatherStrawberry();
    }

  }

  void read() {
    setDestinationTask (
      destination: PointsOfInterest.readingTree,
      onArrival: () {
        replaceAnimation(NeutralFarmerNPCSprites().neutralFarmerReading);
        Future.delayed(Duration(milliseconds: 100), () {
          animation?.play(SimpleAnimationEnum.idleDown);
        });
      },
    );
  }

  void pray() {
    setDestinationTask(destination: PointsOfInterest.goddessStatue, onArrival: () {
      replaceAnimation(NeutralFarmerNPCSprites().neutralFarmerPraying);
      Future.delayed(Duration(milliseconds: 100), () {
        animation?.play(SimpleAnimationEnum.idleDown);
      });
    }
    );
    
  }

   void gatherStrawberry() {
    setDestinationTask(
      destination: PointsOfInterest.straberryBush,
      onArrival: () {
        replaceAnimation(NeutralFarmerNPCSprites().farmerGathering);
        Future.delayed(Duration(milliseconds: 100), () {
          animation?.play(SimpleAnimationEnum.idleDown);
        });
      },
    );

  }

  void returnHome() {
    setDestinationTask(
      destination: PointsOfInterest.farmersHouse, 
      onArrival: () {
      toggleKeepRendered();
      context.read<NPCController>().npcs[index].isInGame = false;
      removeFromParent();
    });
  }

  void setDestinationTask({required Vector2 destination, required Function onArrival}) {
    if(!isCloseEnoughToDestination(destination)) {
      replaceAnimation(NeutralFarmerNPCSprites().neutralFarmerAnimations);

      currentDestination = destination;
      currentTask = () {
        onArrival();
      };
    }
  }
  
  bool isCloseEnoughToDestination(Vector2 destination) {
    return ((position.x >= destination.x - 175) && (position.x <= destination.x + 175)) && ((position.y >= destination.y - 175) && (position.y <= destination.y + 175));
  }
}