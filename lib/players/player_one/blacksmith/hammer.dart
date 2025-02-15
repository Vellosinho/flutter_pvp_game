
import 'package:bonfire/mixins/attackable.dart';

class Hammer {
  int? damage = 20;
  DamageType? damageType = DamageType.NONE;

  Hammer({required this.damage, required this.damageType});
}