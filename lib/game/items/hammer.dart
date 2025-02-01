import 'package:projeto_gbb_demo/game/enum/damage_type.dart';

class Hammer {
  int? damage = 20;
  DamageType? damageType = DamageType.none;

  Hammer({this.damage, this.damageType});
}