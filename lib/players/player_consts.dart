import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:projeto_gbb_demo/game/character_faction.dart';

class PlayerConsts extends ChangeNotifier {
  static Vector2 characterSize = Vector2(192, 192);
  static Vector2 characterHitbox = Vector2(96, 40);
  static Vector2 hitboxPosition = Vector2(48,160);
  static double characterSpeed = 400;

  late CharacterFaction faccao = CharacterFaction.Communist;

  void setFaction(CharacterFaction novaFaccao) {
    faccao = novaFaccao;
    notifyListeners();
  }
}