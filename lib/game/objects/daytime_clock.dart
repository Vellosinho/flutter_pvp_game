import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/game/enum/enum_day_time.dart';
import 'package:projeto_gbb_demo/game/game_controller.dart';
import 'package:projeto_gbb_demo/game/npcs/farmerNPC/farmer_npc.dart';
import 'package:projeto_gbb_demo/game/objects/object_sprites.dart';
import 'package:projeto_gbb_demo/players/player_consts.dart';

class DayTimeClock extends GameDecoration {
  LocalGameController localGameController;
  int stashedIron = 0;
  DayTimeClock({
    required Vector2 position,required this.localGameController})
      : super.withSprite(sprite: GameObjectsSprites.anvil, position: position, size: Vector2(0, 0))
;    @override
    Future<void> onLoad() {
      localGameController.startDaynightCycle();
      updateNpcRoutine();
      updateGameLighting();
      print('initialized Daynight Cycle');
      return super.onLoad();
    }

    @override
    void update(double dt) {
        // do anything
        super.update(dt); 
    }

    // void updateGameLighting() {
      

      // gameRef.lighting!.animateToColor(localGameController.lightingColor, duration: Duration(seconds: 10));
    // }

    void updateGameLighting() {
    print("updating Game lighting");
    Future.delayed(Duration(seconds: 10), () {
      updateGameLighting();
    });
    if (localGameController.daytime != DayTime.same) {
      switch (localGameController.daytime) {
        case DayTime.sunrise:
          gameRef.lighting!.animateToColor(Colors.orange[400]!.withAlpha(48), duration: Duration(seconds: 10));
          localGameController.turnOffTimechange();
          return ;
        case DayTime.noon:
          gameRef.lighting!.animateToColor(Colors.orange[400]!.withAlpha(0), duration: Duration(seconds: 10));
          localGameController.turnOffTimechange();
          return ;
        case DayTime.sunset:
          gameRef.lighting!.animateToColor(Colors.orange[400]!.withAlpha(48), duration: Duration(seconds: 10));
          localGameController.turnOffTimechange();
          return ;
        case DayTime.night:
          gameRef.lighting!.animateToColor(Colors.indigo[900]!.withAlpha(148), duration: Duration(seconds: 10));
          localGameController.turnOffTimechange();
          return ;
        default:
          return ;
        }
    }
  }

  void updateNpcRoutine() {
    print("updating Npc Routines");
    int time = localGameController.getTime();

    switch (time) {
      case 630:
        gameRef.add(FarmerNPC(position: Vector2(1501, 2770), size: PlayerConsts.tallNPCSize, initDirection: Direction.right, controller: localGameController),);
        break;
      default:
    }

    Future.delayed(Duration(seconds: 10), () {
      updateNpcRoutine();
    });
  }
  
} 