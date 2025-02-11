import 'dart:math';
import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/npcs/base%20classes/base_action.dart';
import 'package:projeto_gbb_demo/game/npcs/base%20classes/base_npc.dart';
import 'package:projeto_gbb_demo/game/npcs/farmerNPC/farmer_ally.dart';
import 'package:projeto_gbb_demo/game/npcs/npcFunctionalities/npc_dialogue.dart';
import 'package:projeto_gbb_demo/game/npcs/npc_points_of_interest.dart';
import 'package:projeto_gbb_demo/game/npcs/npcs_sprite_sheet.dart';
import 'package:projeto_gbb_demo/players/player_consts.dart';

class FarmerNPC extends BaseNPC {
  LocalGameController controller;
  bool isbusy = false;
  int index = 0;
  int currentConversation = 0;
  bool willTalk = true;
  List<List<NpcDialogue>> dialogue;
  Random rand = Random();

  Vector2 currentDestination = PointsOfInterest.blacksmithMaster;
  Function currentTask = () {};

  FarmerNPC({
    required Vector2 position,
    required Direction initDirection,
    required this.dialogue,
    required int index,
    required this.controller,
  }) : super(
      index: index,
      position: position,
      initDirection: initDirection,
      dialogue: dialogue,
      controller: controller,
      defaultAnimations: NeutralFarmerNPCSprites().neutralFarmerAnimations,
      actions: [
        BaseAction(
          position: PointsOfInterest.strawberryBush,
          newAnimation: NeutralFarmerNPCSprites().farmerGathering,
        ),
        BaseAction(
          position: PointsOfInterest.readingTree,
          newAnimation: NeutralFarmerNPCSprites().neutralFarmerReading,
        ),
        BaseAction(
          position: PointsOfInterest.goddessStatue,
          newAnimation: NeutralFarmerNPCSprites().neutralFarmerPraying,
        ),
      ],
      housePosition: PointsOfInterest.farmersHouse,
    );

    @override
    void convert() {
      gameRef.add(FarmerAlly(position: position, size: size, hitboxPosition: PlayerConsts.hitboxPosition, hitboxSize: PlayerConsts.characterHitbox, controller: controller));
      super.convert();
    }
}