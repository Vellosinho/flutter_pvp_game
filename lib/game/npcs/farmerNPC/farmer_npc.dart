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
  @override
  LocalGameController controller;
  @override
  bool isbusy = false;
  @override
  int index = 0;
  @override
  int currentConversation = 0;
  @override
  bool willTalk = true;
  @override
  List<List<NpcDialogue>> dialogue;
  @override
  Random rand = Random();

  @override
  Vector2 currentDestination = PointsOfInterest.blacksmithMaster;
  @override
  Function currentTask = () {};

  FarmerNPC({
    required super.position,
    required super.initDirection,
    required this.dialogue,
    required super.index,
    required this.controller,
  }) : super(
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
    gameRef.add(FarmerAlly(
        position: position,
        size: size,
        hitboxPosition: PlayerConsts.hitboxPosition,
        hitboxSize: PlayerConsts.characterHitbox,
        controller: controller));
    super.convert();
  }
}
