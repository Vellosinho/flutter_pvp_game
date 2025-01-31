import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game.dart';
import 'package:projeto_gbb_demo/game/game_controller.dart';
import 'package:projeto_gbb_demo/game/npcs/farmerNPC/farmer_ally.dart';
import 'package:projeto_gbb_demo/game/npcs/npc_points_of_interest.dart';
import 'package:projeto_gbb_demo/game/npcs/npcs_sprite_sheet.dart';
import 'package:projeto_gbb_demo/players/player_consts.dart';

class FarmerNPC extends SimpleAlly {
  LocalGameController controller;
  bool isbusy = false;

  Vector2 destiny = PointsOfInterest.blacksmithMaster;
  Function task = () {};

  FarmerNPC({
    required Vector2 position,  
    required Vector2 size,
    required Direction initDirection,
    required this.controller,
  }) : super(
    position: position,
    size: size,
    speed: PlayerConsts.npcSpeed / 2,
    initDirection: initDirection,
    animation: NeutralFarmerNPCSprites().neutralFarmerAnimations,
    receivesAttackFrom: AcceptableAttackOriginEnum.ALL,
    keepRendered: true,
    );

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
      convert();
      super.onReceiveDamage(attacker, 0, identify);
    }

    void convert() {
      controller.playerFollowersAdd();
      gameRef.add(FarmerAlly(position: position, size: size, hitboxPosition: PlayerConsts.hitboxPosition, hitboxSize: PlayerConsts.characterHitbox, controller: controller));
      removeFromParent();
    }

    @override
    void update(double dt) {
      // moveToPosition(Vector2(1749.2115225360892,4038.724698533417));
      // goToDestiny()
      checkHasToMove();
      (gameRef as BonfireGame).addVisible(this);
      super.update(dt);
    }

    void checkHasToMove() {
      if (((position.x >= destiny.x - 200) && (position.x <= destiny.x + 200)) && ((position.y >= destiny.y - 200) && (position.y <= destiny.y + 200))) {
        stopMove();
        if (!isbusy) {
          isbusy = true;
          task();
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
      moveToPosition(destiny);
    }

    void initializeRoutine() {
      int time = controller.getTime();

      switch (time) {
        case 700:
          // shuffleRoutine();
          read();
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
    print("reading");
    destiny = PointsOfInterest.readingTree;
    task =() {
      replaceAnimation(NeutralFarmerNPCSprites().neutralFarmerReading);
      Future.delayed(Duration(milliseconds: 100), () {
        animation?.play(SimpleAnimationEnum.idleDown);
      });
    };
  }

  void pray() {
    print("praying");
    destiny = PointsOfInterest.goddessStatue;
    task = () {
      replaceAnimation(NeutralFarmerNPCSprites().neutralFarmerPraying);
      Future.delayed(Duration(milliseconds: 100), () {
        animation?.play(SimpleAnimationEnum.idleDown);
      });
    };
  }

   void gatherStrawberry() {
    print("gathering Straberries");
    destiny = PointsOfInterest.straberryBush;
    task = () {
      replaceAnimation(NeutralFarmerNPCSprites().farmerGathering);
      Future.delayed(Duration(milliseconds: 100), () {
        animation?.play(SimpleAnimationEnum.idleDown);
      });
    };

  }

  void returnHome() {
    print('returning Home');
    // destiny()
  }
}