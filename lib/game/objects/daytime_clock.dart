import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/game/controller/npc_controller.dart';
import 'package:projeto_gbb_demo/game/enum/enum_day_time.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/npcs/farmerNPC/farmer_npc.dart';
import 'package:projeto_gbb_demo/game/objects/object_sprites.dart';
import 'package:projeto_gbb_demo/game/structs/npc_structure.dart';
import 'package:provider/provider.dart';

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
    int time = localGameController.getTime();

    List<NpcStructure> npcs = context.read<NPCController>().getSpawningNpcs(time);

    for(int i = 0; i < npcs.length; i++){
      gameRef.add(
        FarmerNPC(position: npcs[i].spawningLocation, initDirection: Direction.right, index: npcs[i].index, controller: localGameController, dialogue: npcs[i].dialogue)
      );
    }

    Future.delayed(Duration(seconds: 10), () {
      updateNpcRoutine();
    });
  }
  
} 