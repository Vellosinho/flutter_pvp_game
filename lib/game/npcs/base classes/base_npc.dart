import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/controller/npc_controller.dart';
import 'package:projeto_gbb_demo/game/npcs/base%20classes/base_action.dart';
import 'package:projeto_gbb_demo/game/npcs/npcFunctionalities/npc_dialogue.dart';
import 'package:projeto_gbb_demo/game/npcs/npcFunctionalities/npc_say.dart';
import 'package:projeto_gbb_demo/players/player_consts.dart';
import 'package:provider/provider.dart';

class BaseNPC extends SimpleAlly with PathFinding {
  LocalGameController controller;
  bool isbusy = false;
  int index = 0;
  int currentConversation = 0;
  bool willTalk = true;
  List<List<NpcDialogue>> dialogue;
  Random rand = Random();
  Function currentTask = () {};
  Vector2 currentDestination = Vector2(0, 0);
  List<BaseAction> actions;
  Vector2 housePosition;
  SimpleDirectionAnimation defaultAnimations;

  BaseNPC({
    required Vector2 position,
    required Direction initDirection,
    required this.dialogue,
    required int index,
    required this.controller,
    required this.defaultAnimations,
    required this.actions,
    required this.housePosition,
  }) : super(
    position: position,
    size: PlayerConsts.tallNPCSize,
    speed: PlayerConsts.npcSpeed / 2,
    initDirection: initDirection,
    receivesAttackFrom: AcceptableAttackOriginEnum.ALL,
    animation: defaultAnimations,
    keepRendered: true,
    );
    @override
    Future<void> onLoad() {
      add(RectangleHitbox(size: PlayerConsts.characterHitbox, position: PlayerConsts.hitboxPosition));
      initializeDay();
      setupPathFinding(pathLineColor: Colors.transparent);
      return super.onLoad();
    }

    @override
    void onReceiveDamage(attacker, double damage, identify, damageType) {
      if (willTalk && currentConversation < dialogue.length) {
        talk();
      }
      checkAffinity();
      willTalk = !willTalk;
      super.onReceiveDamage(attacker, 0, identify, damageType);
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
      // gameRef.add(FarmerAlly(position: position, size: size, hitboxPosition: PlayerConsts.hitboxPosition, hitboxSize: PlayerConsts.characterHitbox, controller: controller));
      toggleKeepRendered();
      removeFromParent();
    }

    void checkHasToMove() {
      if ((((position.x >= currentDestination.x - 175) && (position.x <= currentDestination.x + 175)) && ((position.y >= currentDestination.y - 175) && (position.y <= currentDestination.y + 175)) && !isbusy)) {
        isbusy = true;
        Future.delayed(Duration(milliseconds: 1000), () {
          currentTask();
        });
      }

      Future.delayed(Duration(seconds: 5), () {
        checkHasToMove();
      });

    }

    void initializeDay() {
      getRoutine();

      Future.delayed(Duration(seconds: 5), () {
        checkHasToMove();
      });
    }

    void getRoutine() {
      int time = controller.getTime();
      switch (time) {
        case 640:
          shuffleRoutine();
          break;
        case 900:
          shuffleRoutine(); 
          break;
        case 1100:
          shuffleRoutine();
          break;
        case 1300:
          shuffleRoutine();
          break;
        case 1500:
          shuffleRoutine();
          break;
        case 1700:
          shuffleRoutine();
          break;
        case 1800:
          returnHome();
          break;
        default:
          // stopMove();
      }
      
      
      Future.delayed(Duration(seconds: 10), () {
        getRoutine();
      });
    }

  void shuffleRoutine() {

    int nextTask = rand.nextInt(3);

    switch (nextTask) {
      case 0:
        action1();
        break;
      case 1:
        action2();
        break;
      case 2:
        action3();
        break;
      default:
        action1();
    }

  }

  void action1() {
    setDestinationTask (
      destination: actions[0].position,
      onArrival: () {
        replaceAnimation(actions[0].newAnimation);
        Future.delayed(Duration(milliseconds: 100), () {
          animation?.play(SimpleAnimationEnum.idleDown);
        });
      },
    );
  }

  void action2() {
    setDestinationTask (
      destination: actions[1].position,
      onArrival: () {
        replaceAnimation(actions[1].newAnimation);
        Future.delayed(Duration(milliseconds: 100), () {
          animation?.play(SimpleAnimationEnum.idleDown);
        });
      },
    );
  }

   void action3() {
    setDestinationTask (
      destination: actions[2].position,
      onArrival: () {
        replaceAnimation(actions[2].newAnimation);
        Future.delayed(Duration(milliseconds: 100), () {
          animation?.play(SimpleAnimationEnum.idleDown);
        });
      },
    );
  }

  void returnHome() {
    setDestinationTask(
      destination: housePosition,
      onArrival: () {
      toggleKeepRendered();
      context.read<NPCController>().npcs[index].isInGame = false;
      removeFromParent();
    });
  }

  void setDestinationTask({required Vector2 destination, required Function onArrival}) {
    isbusy = false;
    if(destination != currentConversation) {
      replaceAnimation(defaultAnimations);
      currentDestination = destination;
      currentTask = () {
        onArrival();
      };
      Future.delayed(Duration(milliseconds: 1000), () {
      moveToPositionWithPathFinding(currentDestination);});
    }
  }
  
  bool isCloseEnoughToDestination(Vector2 destination) {
    return ((position.x >= destination.x - 175) && (position.x <= destination.x + 175)) && ((position.y >= destination.y - 175) && (position.y <= destination.y + 175));
  }
}