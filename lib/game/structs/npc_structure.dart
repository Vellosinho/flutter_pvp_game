import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game/npcs/npcFunctionalities/npc_dialogue.dart';

class NpcStructure {
  int affinity = 0;
  int spawningHour = 0;
  int index = 0;
  bool isInGame = false;
  Vector2 spawningLocation = Vector2(0, 0);
  Profession profession = Profession.FARMER;
  List<List<NpcDialogue>> dialogue = [];

  NpcStructure(
      {required this.affinity,
      required this.spawningHour,
      required this.index,
      required this.spawningLocation,
      required this.profession,
      required this.dialogue});
}

enum Profession { FARMER, SHEPPARD }
