import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:projeto_gbb_demo/game/enum/character_faction.dart';

class PlayerConsts extends ChangeNotifier {
  static Vector2 characterSize = Vector2(192, 240);
  static Vector2 npcSize = Vector2(192, 192);
  static Vector2 characterHitbox = Vector2(96, 64);
  static Vector2 characterHitboxPosition = Vector2(48,176);
  static Vector2 hitboxPosition = Vector2(48,140);
  static double characterSpeed = 400;
  static double slowCharacterSpeed = 300;

  late CharacterFaction faccao = CharacterFaction.Communist;

  void setFaction(CharacterFaction novaFaccao) {
    faccao = novaFaccao;
    notifyListeners();
  }
}